# frozen_string_literal: true

class Api::HospitalsController < ApplicationController
  def create
    # TODO: Handle nil values for location attributes
    country_code = params[:country]
    country = CS.countries[country_code.to_sym]
    hospital_name = params[:hospital_name]
    contact_name = params[:contact_name]
    contact_email = params[:contact_email]
    state = params[:state]
    city = params[:city]

    begin
      hospital = create_hospital(hospital_name, country, state, city)
    rescue StandardError
      flash.alert = '<i class="fas fa-exclamation-triangle mr-1"></i> ' +
                    t('hospitals.index.form.messages.error')
      redirect_to(hospitals_path) && return
    end

    begin
      create_hospital_staff(contact_name, contact_email, hospital.id)
    rescue StandardError
      flash.alert = '<i class="fas fa-exclamation-triangle mr-1"></i> ' +
                    t('hospitals.index.form.messages.error')
      redirect_to(hospitals_path) && return
    end

    flash.notice = '<i class="fas fa-heart mr-1"></i> ' + t('hospitals.index.form.messages.success')
    redirect_to(root_path) && return
  end

  def create_hospital(hospital_name, country, state, city)
    Hospital.create!(
      name: hospital_name,
      country: country,
      state: state,
      city: city
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
