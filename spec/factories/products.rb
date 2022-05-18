FactoryBot.define do
  factory :product do
    name               { Faker::JapaneseMedia::DragonBall.planet }
    detail             { Faker::Hipster.sentence }
    category_id        {Faker::Number.within(range: 1..10)}
    status_id          {Faker::Number.within(range: 1..6)}
    shipping_cost_id   {Faker::Number.within(range: 1..2)}
    prefecture_id      {Faker::Number.within(range: 1..47)}
    shipping_day_id    {Faker::Number.within(range: 1..3)}
    price              { Faker::Number.number(digits: 7) }
    association        :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/sample.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
