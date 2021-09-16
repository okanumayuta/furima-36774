FactoryBot.define do
  factory :order_form do
    postal_code        { '123-4567' }
    prefecture_id      { Faker::Number.between(from: 1, to: 47) }
    city               { '名古屋市' }
    addresses          { '栄１丁目' }
    building           { Faker::Name.initials(number: 2) }
    phone_number       { '09012345678' }
    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
