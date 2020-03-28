require "rails_helper"

RSpec.describe Volunteer, type: :model do
  it "validates email" do
    volunteer = FactoryBot.build(:volunteer, email: "bademail")
    expect(volunteer.valid?).to eq(false)
  end
end
