FactoryBot.define do
  factory :user do
    nickname             {Faker::Name.initials(number:2)}
    email                {Faker::Internet.free_email}
    password             {Faker::Internet.password(min_length:6)}
    password_confirmation{password}
    lastname             {Faker::Name.initials(number:2)}
    firstname            {Faker::Name.initials(number:2)}
    lastname_kana        {Faker::Name.initials(number:2)}
    firstname_kana       {Faker::Name.initials(number:2)}
    birthday             {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
  end
end