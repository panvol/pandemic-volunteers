class GuidelinesController < ApplicationController
  def index
    @guidelines = GuidelinesPresenter.new(locale)
  end
end
