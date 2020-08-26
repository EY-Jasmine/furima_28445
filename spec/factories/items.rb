FactoryBot.define do
  factory :item do
    name            { Faker::Creature::Cat.breed }
    detail          { Faker::Movies::HarryPotter.quote }
    category_id     { Faker::Number.between(from: 2, to: 11) }
    condition_id    { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id   { Faker::Number.between(from: 2, to: 50) }
    day_id          { Faker::Number.between(from: 2, to: 4) }
    price           { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
