class PartnersController < ApplicationController

  def new
    # i18n converts Åland to Aland
    @countries_collection = CS.countries.map { |c| [I18n.transliterate(c[1]), c[0]] }
    @countries_collection.delete(["country_name", :COUNTRY_ISO_CODE])
    @countries_collection = @countries_collection.sort_by {|c| c[0]}
    render locals: { partner: Partner.new, partner_staff: PartnerStaff.new }
  end

  def create
    partner = Partner.new(partner_params)
    partner.type = 0
    partner.city = "test"
    partner.state = "MI"
    partner_staff = PartnerStaff.new(partner_staff_params)
    partner.partner_staff = [partner_staff]

    if partner.save
      binding.pry
      flash.notice = '<i class="fas fa-heart mr-1"></i> Thanks! We will contact you soon.'
      redirect_to '/'
    else
      binding.pry
      flash.now.alert = '<i class="fas fa-exclamation-triangle mr-1"></i> Could not be saved.'

      @countries_collection = CS.countries.map { |c| [I18n.transliterate(c[1]), c[0]] }
      @countries_collection.delete(["country_name", :COUNTRY_ISO_CODE])
      @countries_collection = @countries_collection.sort_by {|c| c[0]}
      render :new, locals: { partner: partner, partner_staff: partner_staff }
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
