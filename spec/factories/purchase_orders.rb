FactoryBot.define do
  factory :purchase_order do
    association        :user
    association        :product
  end
end
