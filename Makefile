all: data/allkeys.txt data/common 

data/allkeys.txt:
	mkdir data
	wget http://www.unicode.org/Public/UCA/latest/allkeys.txt
	mv allkeys.txt data

data/common:
	wget http://unicode.org/Public/cldr/33/cldr-common-33.0.zip
	unzip cldr-common-33.0.zip "common/collation/*" -d data/
	rm cldr-common-33.0.zip
