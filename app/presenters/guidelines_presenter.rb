class GuidelinesPresenter
  ROOT_PATH = Rails.root.join("lib/markdown").freeze
  METADATA_FILE_NAME = "metadata.yml".freeze

  def initialize(locale)
    @locale = locale
  end

  def categories
    guideline_dir_paths.map do |dir_path|
      GuidelineCategory.new(
        dir_path.to_s,
        metadata(dir_path),
      )
    end
  end

  def title
    metadata(guidelines_path)[:title]
  end

  def description
    metadata(guidelines_path)[:description]
  end

  def metadata(dir_path)
    YAML::load_file(File.join(dir_path, METADATA_FILE_NAME)).symbolize_keys!
  end

  private

  def guideline_dir_paths
    Pathname.new(guidelines_path).children.select(&:directory?)
  end

  def guidelines_path
    root_path("guidelines")
  end

  def root_path(dir_name)
    "#{ROOT_PATH}/#{locale}/#{dir_name}"
  end

  attr_reader :locale
end
