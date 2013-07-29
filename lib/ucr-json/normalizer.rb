module UCRJson

  class Normalizer
    include UCRJson::Helpers

    PROTECTED_KEYS = ["FIPS COUNTY CODE",
                      "COUNTY CODE",
                      "FIPS STATE CODE",
                      "STATE CODE"]

    def self.run(year)
      self.new(year).write
    end

    def initialize year
      @year = year
      @schema = code_table['normalization_schema']
      @data = open_and_read "#{MAPPED_PATH}/#{@year}.json"
    end

    def prepare_directory!
      Dir.mkdir(NORMALIZED_PATH) unless Dir.exists?(NORMALIZED_PATH)
    end

    def flagged_keys
      @flagged_keys ||= @schema.flatten.map do |hash|
        hash['for']
      end.flatten.uniq
    end

    def normalized
      @normalized ||= @data.map do |data|
        Hash[data.map do |key, entry|
               [parameterize(normalize_key(key)), normalize_value(key, entry)]
        end]
      end
    end

    def run
      File.open("#{NORMALIZED_PATH}/#{File.basename(path)}", 'w+') do |file|
        file.write JSON.pretty_generate normalized
      end
    end

    def normalize_value key, value
      if PROTECTED_KEYS.include?(key)
        is_missing?(value) ? nil : value
      else
        is_missing?(value) ? nil : value.to_i
      end
    end

    def normalize_key key
      return key unless flagged_keys.include?(key)
      match = @schema.select do |entry|
        entry['for'].include?(key)
      end
      return match.first['use']
    end

  end

end
