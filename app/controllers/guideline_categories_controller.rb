class GuidelineCategoriesController < ApplicationController
  def index
    @category = nil
  end

  def fetch_categories
    GuidelinesPresenter.new(locale).categories
  end
end
