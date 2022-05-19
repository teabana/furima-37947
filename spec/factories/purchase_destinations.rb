FactoryBot.define do
  factory :purchase_destination do
    postal_code       { '123-4567' }
    prefecture_id     { Faker::Number.within(range: 1..47) }
    city              { Faker::Address.city }
    blockname         { Faker::Address.building_number }
    building          { Faker::BossaNova.artist }
    phone_number      { Faker::Number.number(digits: 11) }
    token             { "tok_abcdefghijk00000000000000000" }
  end
end
