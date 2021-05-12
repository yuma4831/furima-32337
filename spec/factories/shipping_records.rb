FactoryBot.define do
  factory :shipping_record do
    postal_code         { '111-1111' }
    shippingarea_id     { Faker::Number.between(from: 2, to: 48) }
    municipalities      { '横浜市' }
    adress              { '１丁目１−１' }
    buildingname      { 'テストビル' }
    phonenumber         { '08012345678' }
    token               { 'tok_849f66894db6a27f3e9d1d42ba40' }
    user_id             { '1' }
    item_id             { '1' }
  end
end
