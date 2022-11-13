FactoryBot.define do
  factory :order_address do
    post_code        { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    shipping_from_id { Faker::Number.between(from: 2, to: 48) }
    city             { Faker::Address.city }
    block_number     { Faker::Address.street_address }
    building         { Faker::Address.street_address }
    phone_number     { Faker::Number.decimal_part(digits: 11) }
    user_id          { Faker::Number.non_zero_digit }
    item_id          { Faker::Number.non_zero_digit }
  end
end
