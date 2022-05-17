class Product < ApplicationRecord


  with_options presence: true do
    validates     :name
    validates     :price
    validates     :detail
    validates     :category_id
    validates     :status_id
    validates     :shipping_cost_id
    validates     :prefecture_id
    validates     :shipping_day_id
  end
end
