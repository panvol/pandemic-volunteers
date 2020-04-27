# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HospitalStaff, type: :model do
  let(:hospital) { FactoryBot.create(:hospital) }

  it 'requires email' do
    hospital_staff = FactoryBot.build(:hospital_staff, email: nil, hospital_id: hospital.id)
    expect(hospital_staff.valid?).to eq(false)
    expect(hospital_staff.errors[:email]).to include("can't be blank")
  end

  it 'requires name' do
    hospital_staff = FactoryBot.build(:hospital_staff, name: nil, hospital_id: hospital.id)
    expect(hospital_staff.valid?).to eq(false)
    expect(hospital_staff.errors[:name]).to include("can't be blank")
  end

  it 'requires hospital_id' do
    hospital_staff = FactoryBot.build(:hospital_staff, hospital_id: nil)
    expect(hospital_staff.valid?).to eq(false)
    expect(hospital_staff.errors[:hospital_id]).to include("can't be blank")
  end

  it 'checks that hospital exists' do
    hospital_staff = FactoryBot.build(:hospital_staff, hospital_id: 123_456)
    expect(hospital_staff.valid?).to eq(false)
    expect(hospital_staff.errors[:hospital_id]).to include('Hospital does not exist')
  end

  it 'checks that email is valid' do
    hospital_staff = FactoryBot.build(:hospital_staff, email: 'no good', hospital_id: hospital.id)
    expect(hospital_staff.valid?).to eq(false)
    expect(hospital_staff.errors[:email]).to include('is invalid')
  end

  it 'checks that email is unique' do
    hospital_staff_1 = FactoryBot.create(:hospital_staff, hospital_id: hospital.id)
    hospital_staff_2 = FactoryBot.build(:hospital_staff,
                                        email: hospital_staff_1.email,
                                        hospital_id: hospital.id)
    expect(hospital_staff_2.valid?).to eq(false)
    expect(hospital_staff_2.errors[:email]).to include('has already been taken')
  end
end
