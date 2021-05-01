FactoryBot.define do
  factory :item do
    name              { Faker::Lorem.characters }
    content           { Faker::Lorem.characters }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    condition_id      { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_id   { Faker::Number.between(from: 2, to: 3) }
    shipping_area_id  { Faker::Number.between(from: 2, to: 48) }
    shipping_time_id  { Faker::Number.between(from: 2, to: 4) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
