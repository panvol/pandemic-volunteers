FactoryBot.define do
  factory :partner_staff do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    association :partner
    active { true }
  end
end
