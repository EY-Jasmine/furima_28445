FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
    family_name           { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    myoji_kana            { Gimei.last.katakana }
    namae_kana            { Gimei.first.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
