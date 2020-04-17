class GuidelineCategoriesController < ApplicationController
  def index
    @category =
  end

  def fetch_categories
    GuidelinesPresenter.new(locale).categories
  end
end
