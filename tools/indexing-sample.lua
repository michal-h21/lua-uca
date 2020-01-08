kpse.set_program_name "luatex"

local ieclib = require "ieclib"
ieclib.load_enc{"T1", "T2A", "T2B", "T2C", "T3", "T5", "LGR"}
local function parse_index_entries(text)
  local indexentries = {}
  for entry, locator in text:gmatch("indexentry{(.-)}{(.-)}") do
    ieclib.process(entry)

  end
end

local text =  io.read("*all")
local index = parse_index_entries(text)

