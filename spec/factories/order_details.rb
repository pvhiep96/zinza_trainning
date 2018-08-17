FactoryBot.define do
  factory :order_detail do
    price { Faker::Number.number(3) }
    quantity { Faker::Number.number(3) }
  end
end
