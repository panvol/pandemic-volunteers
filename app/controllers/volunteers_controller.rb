class VolunteersController < ApplicationController
  def create
    @volunteer = Volunteer.create!(volunteer_params)
    @volunteer.active = true
    @volunteer.assigned = false
    redirect_to root_path
  end

  def volunteer_params
    params.permit(:country, :state, :city, :name, :email, :phone, :immunity, :about)
  end
end