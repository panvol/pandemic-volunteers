class PartnersController < ApplicationController
  def create
    partner = Partner.new(partner_params)
    partner_staff = PartnerStaff.new(partner_staff_params)

    if partner.save && partner_staff.save
      partner_staff.update(partner: partner)

      flash.notice = '<i class="fas fa-heart mr-1"></i> Thanks! We will contact you soon.'
      redirect_to '/'
    else
      flash.now.alert = '<i class="fas fa-exclamation-triangle mr-1"></i> Could not be saved.'
      render :template => 'home/index'
    end
  end

  private

  def partner_params
    params.require(:partner).permit(:name, :type, :country, :state, :city, :about)
  end

  def partner_staff_params
    params.require(:partner_staff).permit(:name, :email, :about)
  end
end
