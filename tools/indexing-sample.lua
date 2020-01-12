package.path = package.path .. ";src/?.lua"
local ducet = require "lua-uca.lua-uca-ducet"
local collator = require "lua-uca.lua-uca-collator"
local languages = require "lua-uca.lua-uca-languages"

kpse.set_program_name "luatex"


local ieclib = require "ieclib"

local collator_obj = collator.new(ducet)

collator_obj = languages.de_din2(collator_obj)
ieclib.load_enc{"T1", "T2A", "T2B", "T2C", "T3", "T5", "LGR"}

local subentry_levels = {"item", "subitem --", "subsubitem --"}


local function parse_index_entries(text)
  local indexentries = {}
  for entry, locator in text:gmatch("indexentry{(.-)}{(.-)}") do
    local subentries = {}
    -- fix entries produced by inputenc package with utf8 option. They have special encoding.
    local entry = ieclib.process(entry)
    -- parse locator modifires (entry|modifier)
    local entry, locator_modifier = entry:match("([^%|]+)%|?(.*)")
    -- parse formatted entry (sortentry@displayentry)
    local sort_entry,display_entry = entry:match("([^@]+)@?(.*)")
    for subentry in sort_entry:gmatch("([^!]+)") do subentries[#subentries+1] = subentry end
    -- print(sort_entry)
    -- use the lowest subentry level if there is no display_entry
    if display_entry == "" then display_entry = subentries[#subentries] end
    indexentries[#indexentries + 1] = {display_entry = display_entry, subentries = subentries, sort_entry = sort_entry,  locator = locator, locator_modifier = locator_modifier}
  end
  return indexentries
end

local function prepare_index(index)
  local sort_entries = {}
  -- collapse index terms together
  for _, entry in ipairs(index) do
    -- 
    local sort_entry = entry.sort_entry
    local current = sort_entries[sort_entry] or {display_entry = entry.display_entry, sort_entry = sort_entry, subentries = entry.subentries, locators={}}
    -- make warning if there are different display_entry for the same sort key
    if current.display_entry ~= entry.display_entry then print("Warning: two different terms with the same sorting\n", current.display_entry, entry.display_entry) end
    table.insert(current.locators, {locator = entry.locator, locator_modifier = entry.locator_modifier})
    sort_entries[sort_entry] = current
  end
  -- convert the hash table to numeric sorted array again
  local table_to_sort = {}
  for _, v in pairs(sort_entries) do table.insert(table_to_sort, v) end
  return table_to_sort
end

local function sort_index(index)
  return table.sort(index, function(a,b)
    return collator_obj:compare_strings(a.sort_entry, b.sort_entry)
  end)
end

local function sort_locators(index, config)
  local config = config or {}
  -- local 
  for _, v in ipairs(index) do
    for _, locator in ipairs(v.locators) do
      -- support for \see and \seealso
      local see = locator.locator_modifier:match("(see.+)")
      locator.sort_entry = see and see or locator.locator
    end
    sort_index(v.locators)
  end
end

local function make_subentries(entry, entries, used_headers)
  local current_headers = used_headers
  local function get_subentry_level(level)
    return subentry_levels[level] or subentry_levels[#subentries]
  end
  local function get_next_level(level)
    local subentries = entry.subentries
    local current_entry = subentries[level]
    if level < #subentries then
      if not current_headers[current_entry] then
        current_headers[current_entry] = {}
        table.insert(entries, {display_entry = current_entry, locators = {}, itemize = get_subentry_level(level)})
      end
      current_headers = current_headers[current_entry]
      return get_next_level(level + 1)
    elseif level == #subentries then
      -- insert the \item command for the current level
      entry.itemize = get_subentry_level(level)
      entries[#entries + 1] = entry
      return entries
    end
  end
  get_next_level(1)
  return entries
end

local function prepare_subentries(current_group)
  local used_headers = {}
  local entries = {}
  for _, entry in ipairs(current_group) do 
    -- make correct entries for \index{entry!subentry}
    entries = make_subentries(entry, entries, used_headers)
  end
  return entries
end

local function prepare_groups(index)
  -- todo: make groups
  return {{entries = index, header = "all"}}
end

-- prepare locators for print
local function make_locators(locators)
  local list = {}
  for _, l in ipairs(locators) do
    local modifier = l.locator_modifier or ""
    if modifier ~= "" then modifier = "\\" .. modifier end
    list[#list+1] = modifier .. "{" .. l.locator .. "}"

  end
  return list
end

local function print_tex_command(command)
  print("\\" .. command)
end

local function print_index(index)
  -- make groups for the first letters
  local groups = prepare_groups(index)
  print_tex_command "begin{theindex}"
  for i, group in ipairs(groups) do
    -- make subitems for the current group
    if i > 1 then print_tex_command("indexspace") end
    print_tex_command("textbf{" .. group.header .. "}")
    group.entries = prepare_subentries(group.entries)
    for _, entry in ipairs(group.entries) do
      local locators = make_locators(entry.locators)
      print_tex_command(entry.itemize .. " " .. entry.display_entry .. " " .. table.concat(locators, ", ") )
    end
  end
 

  print_tex_command "end{theindex}"
  return groups[1].entries

end


local text =  io.read("*all")
local index = parse_index_entries(text)
index = prepare_index(index)
sort_index(index)
sort_locators(index)
local entries = print_index(index)


-- for k,v in ipairs(entries) do 
--   print(k, v.itemize,  v.sort_entry, v.display_entry)
-- end

