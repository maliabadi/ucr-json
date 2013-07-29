require 'json'

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'helpers'
require 'parser'
require 'mapper'
require 'normalizer'

module UCRJson
  include UCRJson::Helpers

  # various static paths
  BASE_DIR = File.expand_path(File.dirname(__FILE__) + "/../../")

  # where various static JSON and TSV resources are kept
  RELATION_PATH = "#{BASE_DIR}/relations"

  # data at all stages of preparation
  DATA_PATH = "#{BASE_DIR}/data"

  # text files from UCR
  UNPARSED_PATH = "#{DATA_PATH}/unparsed"

  # Transitional, nominally parsed into JSON
  PARSED_PATH = "#{DATA_PATH}/parsed"

  # Transitional, data mapped to years
  YEAR_MAPPED_PATH = "#{DATA_PATH}/parsed/mapped"

  # Final, data normalized and ready for use
  NORMALIZED_PATH = "#{DATA_PATH}/parsed/normalized"


  def load!
    parse_data!
    map_data!
    normalize_data!
  end

  def parse_data!
    Dir["#{UNPARSED_PATH}/*.txt"].each do |path|
      Parser.run(path)
    end
  end

  def map_data!
    Dir["#{PARSED_PATH}/*.json"].each do |path|
      Mapper.run year_from_path(path)
    end
  end


  def normalize_data!
    Dir["#{YEAR_MAPPED_PATH}/*.json"].each do |path|
      Normalizer.run year_from_path(path)
    end
  end

end
