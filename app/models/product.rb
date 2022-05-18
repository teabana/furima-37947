class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates     :name
    validates     :price,  numericality: {
      only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"
    }
    validates     :detail
    validates     :category_id,  numericality: { other_than: 0, message: "can't be blank"}
    validates     :status_id,  numericality: { other_than: 0, message: "can't be blank"}
    validates     :shipping_cost_id, numericality: { other_than: 0, message: "can't be blank"}
    validates     :prefecture_id, numericality: { other_than: 0, message: "can't be blank"} 
    validates     :shipping_day_id, numericality: { other_than: 0, message: "can't be blank"}
  end
end
