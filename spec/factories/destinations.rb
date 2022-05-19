FactoryBot.define do
  factory :destination do
    postal_code       { Faker::Number.number(digits: 3) + '-' + Faker::Number.number(digits: 4)}
    prefecture_id     { Faker::Number.within(range: 1..47) }
    city              { Faker::Address.city }
    blockname         { Faker::Address.building_number }
    building          { Faker::BossaNova.artist }
    phone_number      { Faker::Number.number(digits: 11) }
    association        :purchase_order
  end
end
