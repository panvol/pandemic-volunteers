# frozen_string_literal: true

FactoryBot.define do
  factory :hospital do
    country { Faker::Address.country }
    state { Faker::Address.state }
    city { Faker::Address.city }
    name { Faker::Name.name }
  end
end
