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
end
