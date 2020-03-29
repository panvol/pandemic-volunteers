class StatesController < ApplicationController
  def index
    @selected_country = params[:country]
    @states = CS.states(@selected_country)
  end
end
