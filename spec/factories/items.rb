FactoryBot.define do
  factory :item do
    name              { Faker::Lorem.characters }
    content           { Faker::Lorem.characters }
    category_id       { Faker::Number.between(from: 2, to: 11) }
    condition_id      { Faker::Number.between(from: 2, to: 7) }
    shippingfee_id   { Faker::Number.between(from: 2, to: 3) }
    shippingarea_id  { Faker::Number.between(from: 2, to: 48) }
    shippingtime_id  { Faker::Number.between(from: 2, to: 4) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
