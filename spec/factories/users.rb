FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname             { Faker::Name.initials(number: 2) }
    email                { Faker::Internet.free_email }
    password             { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    lastname             { person.last.kanji }
    firstname            { person.first.kanji }
    lastname_kana        { person.last.katakana }
    firstname_kana       { person.first.katakana }
    birthday             { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end
