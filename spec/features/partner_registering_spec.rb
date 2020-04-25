require "rails_helper"

RSpec.feature "A partner", :js do
  scenario "can see errors registering" do
    existing_staff = FactoryBot.create(:partner_staff, email: "existing@partner.com")
    visit "/partners"

    select "United States", from: "partner_country"
    select "Michigan", from: "partner_state"
    select "Ada", from: "partner_city"
    fill_in "partner_name", with: "NGO Corp"
    fill_in "partner_about", with: "We want to help fight Coronavirus!"
    select "NGO", from: "partner_partner_type"

    fill_in "partner_staff_name", with: "Michael"
    fill_in "partner_staff_email", with: "existing@partner.com"
    fill_in "partner_staff_about", with: "I am a software engineer"

    click_button "Apply"

    expect(page).to have_content("Could not be saved!")
    expect(page).to have_content("Email has already been taken")
    expect(Partner.count).to eq(1)
    expect(PartnerStaff.count).to eq(1)
  end

  scenario "can register with the site" do
    visit "/partners"

    select "United States", from: "partner_country"
    select "Michigan", from: "partner_state"
    select "Ada", from: "partner_city"
    fill_in "partner_name", with: "NGO Corp"
    fill_in "partner_about", with: "We want to help fight Coronavirus!"
    select "NGO", from: "partner_partner_type"

    fill_in "partner_staff_name", with: "Michael"
    fill_in "partner_staff_email", with: "new@partner.com"
    fill_in "partner_staff_about", with: "I am a software engineer"

    click_button "Apply"

    expect(page).to have_content("Thank you — we will contact you in 48 hours!")

    expect(Partner.count).to eq(1)
    expect(PartnerStaff.count).to eq(1)
    partner = Partner.first
    expect(partner.country).to eq("US")
    expect(partner.state).to eq("MI")
    expect(partner.city).to eq("Ada")
    expect(partner.name).to eq("NGO Corp")
    expect(partner.about).to eq("We want to help fight Coronavirus!")
    expect(partner.partner_type).to eq("NGO")

    staff = PartnerStaff.first
    expect(staff.name).to eq("Michael")
    expect(staff.email).to eq("new@partner.com")
    expect(staff.about).to eq("I am a software engineer")
  end
end
