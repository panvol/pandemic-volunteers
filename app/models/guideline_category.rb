class GuidelineCategory
  attr_reader :slug, :position, :title, :description, :svg_filename, :articles
  def initialize(dir_path, metadata)
    @dir_path = dir_path
    @slug = extract_slug
    @position = extract_position
    @title = metadata.title
    @description = metadata.description
    @svg_filename = metadata.svg_filename
    @articles = []
  end

  private

  def extract_slug
    dir_path.match(/\d+-(\w.*)$/)[1]
  end

  def extract_position
    dir_path.match(/(\d+)(?!.*\d)/)[1]&.to_i
  end

  attr_reader :dir_path
end
