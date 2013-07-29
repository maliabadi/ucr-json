module UCRJson

	class Mapper
		include UCRJson::Helpers

        def self.run(id)
        	self.new(id).run
        end

		def initialize id
			@schema = code_table['selection_schema'][id]
			@data = open_and_read "#{PARSED_PATH}/#{id}.json"
			prepare_directory!
		end

		def prepare_directory!
			Dir.mkdir(YEAR_MAPPED_PATH) unless Dir.exists?(YEAR_MAPPED_PATH)
		end

		def is_multi_year?
			@schema.keys.include?('section_to_year')
		end

		def write_year_data year, data
			File.open("#{YEAR_MAPPED_PATH}/#{year.to_s}.json", 'w+') do |file|
				file.write JSON.pretty_generate data
			end
		end

		def select_section section
			@data.select do |entry|
				entry[hash.keys[2]].to_i == section.to_i
			end
		end

		def run
			if is_multi_year?
				@schema['section_to_year'].each_pair do |section, year|
					write_year_data year, select_section(section)
				end
			else
				write_year_data(@schema['years'].first,
					            @schema['sections'].map do
									select_section(section)
								end.flatten)
			end
		end

	end

end