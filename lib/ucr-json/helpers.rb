module UCRJson

  module Helpers

    def year_from_path path
      File.basename(path)
      .split('.')
      .first
    end

    def parameterize(string)
      string.gsub(/[^\w\s]/, '').downcase.gsub(/\s+/, '_')
    end

    def is_missing?(string)
      string.scan(/9/).size == string.size
    end

    def open_and_read_rows path
      File.open(path, 'r') do |file|
        file.read.split(/\n/)
      end
    end

    def open_and_read path
      File.open(path, 'r') do |file|
        JSON.parse file.read
      end
    end

    def open_and_read_columns path
      open_and_read_rows(path).map do |row|
        row.split(/\t/).map do |column|
          column.gsub(/["']/, '')
        end
      end
    end

    def schema_data
      @schema_data ||= open_and_read "#{RELATION_PATH}/schema.json"
    end

    def code_table
      @code_table ||= schema_data['code_table']
    end

  end

end
