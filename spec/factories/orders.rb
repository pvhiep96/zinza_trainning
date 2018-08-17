FactoryBot.define do
  factory :order do
    total { Faker::Number.number(3) }
    status 'not_checkout'
  end
end
