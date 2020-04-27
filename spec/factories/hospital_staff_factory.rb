# frozen_string_literal: true

FactoryBot.define do
  factory :hospital_staff do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    hospital_id { Faker::Number.number }
    active { true }
  end
end
