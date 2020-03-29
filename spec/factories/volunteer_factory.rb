FactoryBot.define do
  factory :volunteer do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { "1234567890" }
    about { Faker::Lorem.sentences }
  end
end
