# frozen_string_literal: true

class VolunteerNotifierMailer < ApplicationMailer
  def send_registration_email(volunteer)
    @volunteer = volunteer
    mail(to: @volunteer.email,
         subject: 'Pandemic Volunteers Registration')
  end
end
