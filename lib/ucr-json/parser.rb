module UCRJson

  class Parser
    include UCRJson::Helpers

    def self.run id
      self.new(id).run
    end

    def initialize id
      @id = id
      prepare_directory!
    end

    def prepare_directory!
      Dir.mkdir(PARSED_PATH) unless Dir.exists(PARSED_PATH)
    end

    def data_rows
      @data_rows ||= open_and_read_rows "#{UNPARSED_PATH}/.#{@id}.txt"
    end

    def id_to_variable_set
      @id_to_definition_file ||= Hash[code_table.map do |entry|
                                        [entry['icspr'], entry['variable_set']]
      end]
    end

    def id_to_part_declaration
      @id_to_part_declaration ||= Hash[code_table.map do |entry|
                                         [entry['icspr'], entry['part_declaration']]
      end]
    end

    def variable_set
      @variable_set ||= open_and_read_columns("#{RELATION_PATH}/definitions/#{id_to_variable_set[@id]}.csv")
    end

    def part
      zero_index = Proc.new {|n| n-1}
      @part ||= id_to_part_declaration[@id]
      .map(&zero_index)
      .map(&:to_s)
      .join('')
    end

    def sections
      @sections ||= variable_set
      .map(&:last)
      .map do |row|
        row.split(',').map(&:strip)
      end.flatten.uniq
    end

    def section_to_definition
      @section_to_definition ||= Hash[sections.map do |section|
                                        [section, variable_set.select do |row|
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
    end

    def definition
      @definitions ||= Hash[section_to_definition[part]]
    end

    def parsed
      @parsed ||= data_rows.map do |row|
        Hash[definition.map do |label, indices|
               [label, indices.map do |index|
                  row[index]
               end.join('')]
        end]
      end
    end

    def run
      File.open("#{PARSED_PATH}/#{@id}.json", 'w+') do |file|
        file.write JSON.pretty_generate parsed
      end
    end

  end

end
