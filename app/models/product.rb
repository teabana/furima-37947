class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates     :name
    validates     :price
    validates     :detail
    validates     :category_id,  numericality: { other_than: 0, message: "can't be blank "}
    validates     :status_id,  numericality: { other_than: 0, message: "can'T be blank"}
    validates     :shipping_cost_id
    validates     :prefecture_id
    validates     :shipping_day_id
  end
end
