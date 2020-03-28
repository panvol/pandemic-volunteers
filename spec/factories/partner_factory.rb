FactoryBot.define do
  factory :partner do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
  end
end
