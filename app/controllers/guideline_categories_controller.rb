class GuidelineCategoriesController < ApplicationController
  def index
    category = params[:category]
    dir_path =  Guidelines::UtilsHelper.category_path(category)
    if dir_path
      @category = GuidelineCategory.new(
          dir_path.to_s,
          GuidelinesMetadataExtractor.new(dir_path),
        )
    else
      not_found
    end
  end
end
