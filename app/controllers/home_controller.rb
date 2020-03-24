class HomeController < ApplicationController
  def index
    if !@volunteer
      @volunteer = Volunteer.new()
    end
  end
end
