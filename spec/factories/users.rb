FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '阿アあ' }
    last_name             { '阿アあ' }
    first_name_kana       { 'アアア' }
    last_name_kana        { 'アアア' }
    birth_date            { Faker::Date.between(from: '1930-01-01', to: '2021-09-8') }
  end
end
