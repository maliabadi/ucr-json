# collect the unique keys that are used to identify the types of
# offense being reported. It does vary a bit from year to year.

require 'rubygems'
require 'json'
require 'awesome_print'

RELATION_PATH = File.expand_path(File.dirname(__FILE__) + "/../relations")
DATA_PATH = File.expand_path(File.dirname(__FILE__) + "/../data/parsed/years")

def open_and_read path
	File.open(path, 'r') do |file|
		JSON.parse file.read
	end
end

def get_unique_keys
	keys = Dir["#{DATA_PATH}/*.json"].map do |path|
		open_and_read(path)
	end.flatten.map(&:keys).flatten.uniq.sort
	File.open(RELATION_PATH + "/variable_keys.json", 'w+') do |file|
		file.write JSON.pretty_generate keys
	end
end

if ARGV[0] == 'run'
	get_unique_keys
end