require "rails_helper"

RSpec.describe VolunteerNotifierMailer, type: :mailer do
  describe "send_registration_email" do
    volunteer = Volunteer.new(email: 'thor@asgard.gov', name: 'Thor Odinson')
    let(:mail) { VolunteerNotifierMailer.send_registration_email(volunteer) }

    it "renders the headers" do
      expect(mail.subject).to eq('Pandemic Volunteers Registration')
      expect(mail.to).to eq([volunteer.email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(/Dear #{volunteer.name}/)
    end
  end
end
