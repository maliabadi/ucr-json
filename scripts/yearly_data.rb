# This file is here for demonstrative purposes only
# It's here to show methodology, rather than really provide utility

require 'rubygems'
require 'json'
require 'awesome_print'

RELATION_PATH = File.expand_path(File.dirname(__FILE__) + "/../relations")
DATA_PATH = File.expand_path(File.dirname(__FILE__) + "/../data/parsed")

def open_and_read path
	File.open(path, 'r') do |file|
		JSON.parse file.read
	end
end


def get_study_keys
	open_and_read "#{RELATION_PATH}/study_keys.json"
end

def get_study icpsr
	open_and_read "#{DATA_PATH}/#{icpsr}.json"
end

def run
	get_study_keys.each_pair do |study, data|
		study_data = get_study(study)
		if data.keys.include?('section_to_year')
			# multi-year study
			data['section_to_year'].each_pair do |section, year|
				year_data = study_data.select do |hash|
					hash[hash.keys[2]].to_i == section.to_i
				end
				File.open("#{DATA_PATH}/years/#{year.to_s}.json", 'w+') do |file|
					file.write JSON.pretty_generate year_data
				end
			end
		else
			# single-year study
			study_year = data['years'][0]
			File.open("#{DATA_PATH}/years/#{study_year.to_s}.json", 'w+') do |file|
				file.write JSON.pretty_generate study_data
			end
		end
	end
end

def one study
	data = get_study_keys[study]
	study_data = get_study(study)
	if data.keys.include?('section_to_year')
		# multi-year study
		data['section_to_year'].each_pair do |section, year|
			year_data = study_data.select do |hash|
				hash[hash.keys[2]].to_i == section.to_i
			end
			ap year_data
			File.open("#{DATA_PATH}/years/#{year.to_s}.json", 'w+') do |file|
				file.write JSON.pretty_generate year_data
			end
		end
	else
		# single-year study
		study_year = data['years'][0]
		File.open("#{DATA_PATH}/years/#{study_year.to_s}.json", 'w+') do |file|
			file.write JSON.pretty_generate study_data
		end
	end

end

if ARGV[0] == 'run'
	run
end
if ARGV[0] == 'one'
	one ARGV[1]
end
