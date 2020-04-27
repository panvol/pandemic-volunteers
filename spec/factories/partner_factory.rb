# frozen_string_literal: true

FactoryBot.define do
  factory :partner do
    name { Faker::Name.name }
    country { Faker::Address.country }
    state { Faker::Address.state }
    city { Faker::Address.city }
    partner_type { 0 }
  end
end
