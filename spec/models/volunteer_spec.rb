require "rails_helper"

RSpec.describe Volunteer, type: :model do
  it "validates email" do
    volunteer = FactoryBot.build(:volunteer, email: "bademail")
    expect(volunteer.valid?).to eq(false)

    expect(volunteer.errors[:email][0]).to eq("is not a valid email address.")
  end

  it "validates phone" do
    volunteer = FactoryBot.build(:volunteer, phone: "bad")
    expect(volunteer.valid?).to eq(false)

    expect(volunteer.errors[:phone][0]).to eq("is not a valid phone number.")
  end

  it "requires email, phone, name, and about" do
    volunteer = Volunteer.new
    expect(volunteer.valid?).to eq(false)

    expect(volunteer.errors[:email][0]).to eq("can't be blank")
    expect(volunteer.errors[:phone][0]).to eq("can't be blank")
    expect(volunteer.errors[:name][0]).to eq("can't be blank")
    expect(volunteer.errors[:about][0]).to eq("can't be blank")
  end

  describe "Volunteer groups" do
    it "has collection of groups" do
      volunteer_groups = Volunteer.groups
      groups = {
        "hospital" => "help nurses in hospitals",
        "triage" => "visit patients in home isolation",
        "healthcare" => "give care to dependents of healthcare workers",
        "elderly" => "cater to the needs of the elderly",
        "research" => "curate academic research for busy doctors",
        "operations" => "operations",
        "other" => "other"
      }

      expect(volunteer_groups).equal?(groups)
    end

    it "has a support_unit attribute" do
      volunteer =  FactoryBot.build(:volunteer)

      begin
        expect { volunteer.group }.not_to raise_error
      rescue RSpec::Expectations::ExpectationNotMetError => e
        expect(e.message).not_to include 'NoMethodError'
      end
    end
  end
end
