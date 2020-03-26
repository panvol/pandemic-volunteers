class VolunteersController < ApplicationController
  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.country = nil if @volunteer.country.blank?
    @volunteer.state = nil if @volunteer.state.blank?
    @volunteer.city = nil if @volunteer.city.blank?
    
    if @volunteer.save
      flash.notice = '<i class="fas fa-heart mr-1"></i> Thanks! We will contact you soon'
      redirect_to '/' and return
    else
      flash.now.alert = '<i class="fas fa-exclamation-triangle mr-1"></i> Could not be saved'
      render :template => 'home/index' and return
    end
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:country, :state, :city, :name, :email, :phone, :immunity, :about)
  end
end