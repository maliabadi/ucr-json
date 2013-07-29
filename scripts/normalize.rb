require 'json'
require 'rubygems'
require 'awesome_print'

RELATION_PATH = File.expand_path(File.dirname(__FILE__) + "/../relations")
DATA_PATH = File.expand_path(File.dirname(__FILE__) + "/../data/parsed/years")
NORMALIZED_PATH = File.expand_path(File.dirname(__FILE__) + "/../data/parsed/years/normalized")
PROTECTED_KEYS = ["FIPS COUNTY CODE", "COUNTY CODE", "FIPS STATE CODE", "STATE CODE"]


def parameterize(string)
	string.gsub(/[^\w\s]/, '').downcase.gsub(/\s+/, '_')
end

def open_and_read path
	File.open(path, 'r') do |file|
		JSON.parse file.read
	end
end

def get_paths
	Dir["#{DATA_PATH}/*.json"]
end

def get_normalization
	open_and_read "#{RELATION_PATH}/normalization.json"
end

def is_missing?(string)
	string.scan(/9/).size == string.size
end

def get_flagged_keys normalization_data
	normalization_data.flatten.map do |hash|
		hash['for']
	end.flatten.uniq

end

def normalize_all
	norm_data = get_normalization
	norm_flagged = get_flagged_keys(norm_data)
	get_paths.each do |path|
		normalize_data(path, norm_data, norm_flagged)
	end
end

def normalize_data path, norm_data, norm_flagged
	normalized = open_and_read(path).map do |data|
		Hash[data.map do |key, entry|
			[parameterize(normalize_key(norm_data, norm_flagged, key)), normalize_value(key, entry)]
		end]
	end
	File.open("#{NORMALIZED_PATH}/#{File.basename(path)}", 'w+') do |file|
		file.write JSON.pretty_generate normalized
	end
end

def normalize_one(icspr)
	norm_data = get_normalization
	norm_flagged = get_flagged_keys(norm_data)
	path = "#{DATA_PATH}/#{icspr}.json"
	normalize_data(path, norm_data, norm_flagged)
end

def normalize_value key, value
	if PROTECTED_KEYS.include?(key)
		is_missing?(value) ? nil : value 
	else
		is_missing?(value) ? nil : value.to_i
	end
end

def normalize_key norm, flagged, key
	return key unless flagged.include?(key)
	match = norm.select do |hash|
		hash['for'].include?(key)
	end
	return match.first['use']
end

if ARGV[0] == 'all'
	normalize_all
elsif ARGV[0] == 'one'
	raise 'You must supply a ICSPR study as a second argument' unless ARGV.size > 1
	normalize_one(ARGV[1])
end

