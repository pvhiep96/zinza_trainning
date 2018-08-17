FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    price { Faker::Number.number(3) }
    status { Faker::Boolean.boolean }
    quantity { Faker::Number.number(3) }
    description { Faker::Number.number(4) }
    factory :pictures_attributes do
      picture_url { Faker::String.random }
    end
  end
end
