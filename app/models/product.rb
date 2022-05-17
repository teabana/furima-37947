class Product < ApplicationRecord

  belongs_to :user
  has_one_attached :image

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
