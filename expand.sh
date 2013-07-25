#! /Users/mattaliabadi/.rvm/rubies/ruby-1.9.2-p290/bin/ruby

require 'rubygems'
require 'json'
require 'awesome_print'

raise 'No ID provided' unless ARGV.size > 0

DIRNAME = File.dirname(__FILE__)
ID = ARGV.first.strip

data_rows = File.open(DIRNAME + "/data/#{ID}.txt", 'r') do |file|
	file.read.split(/\n/)
end

code_table = File.open(DIRNAME + "/code_table.csv", 'r') do |file|
	file.read.split(/\n/).map do |row|
		row.split(/\t/).map do |column|
			column.gsub(/["']/, '')
		end
	end
end

id_to_definition_file = Hash[code_table.map do |row|
	[row[0], row[4]]
end]

definition_rows = File.open(DIRNAME + "/definitions/#{id_to_definition_file[ID]}.csv", 'r') do |file|
	file.read.split(/\n/).map do |row|
		row.split(/\t/).map do |column|
			column.gsub(/["']/, '')
		end
	end
end

sections = definition_rows
	.map(&:last)
	.map do |row|
		row.split(',').map(&:strip)
	end.flatten.uniq

section_to_definition = Hash[sections.map do |section|
	[section, definition_rows.select do |row|
		row.last.split(',').map(&:strip).include?(section)
	end.map do |row|
		row[0..4]
	end.map do |row|
		row[3] = row[3].split('-').compact.map(&:strip).map.map(&:to_i).map {|x| x - 1}
		unless row[3].size == 1
			row[3] = (row[3][0]..row[3][1]).to_a
		end
		[row[1], row[3]]
	end]
end]

json_data = data_rows.map do |row|
	chars = row.split(//)
	part = ['08714', '08703'].include?(ID) ? chars[5..6].join('').to_i.to_s : chars[5]
	expanded = Hash[section_to_definition[part].map do |var|
		label = var[0]
		value = ''
		indices = var[1]
		indices.each do |index|
			value << chars[index]
		end
		[label, value]
	end]
end

File.open(DIRNAME + "/data/json/#{ID}.json", 'w+') do |file|
	file.write JSON.pretty_generate(json_data)
end