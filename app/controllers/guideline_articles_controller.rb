class GuidelineArticlesController < ApplicationController
  def index
    category = params[:category]
    article = params[:article]
    markdown_file_path =  Guidelines::UtilsHelper.article_path(category, article)
    if markdown_file_path
      @html = MarkdownHelper.to_html(markdown_file_path)
    else
      not_found
    end
  end
end
