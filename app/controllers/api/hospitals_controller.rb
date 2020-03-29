class Api::HospitalsController < ApplicationController
  def create
    country_code = params[:country]
    country = CS.countries[country_code.to_sym]
    hospital_name = params[:hospital_name]
    contact_name = params[:contact_name]
    contact_email = params[:contact_email]
    state = params[:state]
    city = params[:city]

    begin
      hospital = create_hospital(hospital_name, country, state, city)
    rescue => e
      flash.alert = 'There was a problem registering.'
      redirect_to '/hospitals' and return
    end

    begin
      create_hospital_staff(contact_name, contact_email, hospital.id)
    rescue => e
      flash.alert = 'There was a problem registering.'
      redirect_to '/hospitals' and return
    end

    flash.notice = '<i class="fas fa-heart mr-1"></i> Thanks! We will contact you soon'
    redirect_to '/hospitals' and return
  end

  def create_hospital(hospital_name, country, state, city)
    Hospital.create!(
      name: hospital_name,
      country: country,
      state: state,
      city: city,
    )
  end

  def create_hospital_staff(contact_name, contact_email, hospital_id)
    HospitalStaff.create!(
      name: contact_name,
      hospital_id: hospital_id,
      email: contact_email,
      active: true
    )
  end
end
