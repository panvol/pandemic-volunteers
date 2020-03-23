class HomeController < ApplicationController
  def index
    @volunteer = Volunteer.new
  end
end
