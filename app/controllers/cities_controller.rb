class CitiesController < ApplicationController
  def index
    @selected_country = params[:country]
    @selected_state = params[:state]
    @cities = CS.get(@selected_country, @selected_state)
  end
end
