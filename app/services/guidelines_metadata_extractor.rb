class GuidelinesMetadataExtractor
  METADATA_FILE_NAME = "metadata.yml".freeze

  def initialize(path)
    @data = YAML::load_file(File.join(path, METADATA_FILE_NAME)).symbolize_keys!
  end

  def title
    data[:title]
  end

  def description
    data[:description]
  end

  def svg_filename
    data[:svg_filename]
  end

  private

  attr_reader :data
end
