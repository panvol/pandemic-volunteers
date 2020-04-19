module Guidelines::UtilsHelper
  def self.category_path(category)
    root_path = 'lib/markdown/en/guidelines/'
    Dir.glob(root_path + "[0-9][0-9]-" + category).first
  end

  def self.article_path(category, article)
    root_path = 'lib/markdown/en/guidelines/'
    Dir.glob(root_path + '[0-9][0-9]-' + category + '/[0-9][0-9]-' + article + '.md').first
  end
end