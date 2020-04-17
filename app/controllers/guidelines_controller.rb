class GuidelinesController < ApplicationController
  def index
    @guidelines = Guideline.new(locale)
  end
end
