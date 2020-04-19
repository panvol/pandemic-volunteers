class Guideline
  ROOT_PATH = Rails.root.join("lib/markdown").freeze

  attr_reader :title, :description, :svg_filename

  def initialize(locale)
    @locale = locale
    @metadata = GuidelinesMetadataExtractor.new(guidelines_path)
    @title = metadata.title
    @description = metadata.description
    @svg_filename = metadata.svg_filename
  end

  def categories
    guideline_dir_paths.map do |dir_path|
      GuidelineCategory.new(
        dir_path.to_s,
        GuidelinesMetadataExtractor.new(dir_path),
      )
    end
  end

  private

  def guideline_dir_paths
    Pathname.new(guidelines_path).children.select(&:directory?)
  end

  # def categories
  #   Pathname.new(guidelines_path).children.select(&:directory?).map {|path|
  #     path.basename.to_s[3..-1]
  #   }
  # end

  def guidelines_path
    root_path("guidelines")
  end

  def root_path(dir_name)
    "#{ROOT_PATH}/#{locale}/#{dir_name}"
  end

  attr_reader :locale, :metadata
end
