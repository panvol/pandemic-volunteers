require 'rails_helper'

RSpec.describe Hospital, type: :model do
  it 'requires country' do
    hospital = FactoryBot.build(:hospital, country: nil)
    expect(hospital.valid?).to eq(false)
    expect(hospital.errors[:country]).to include("can't be blank")
  end

  it 'requires name' do
    hospital = FactoryBot.build(:hospital, name: nil)
    expect(hospital.valid?).to eq(false)
    expect(hospital.errors[:name]).to include("can't be blank")
  end
end
