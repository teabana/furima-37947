class Destination < ApplicationRecord

  belongs_to :prefecture

  belongs_to: :purchaseorder

  with_options presence: true do
    #3桁-4桁の整数の組み合わせのみ許可する
    validates     :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/, messages: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates     :prefecrure_id
    validates     :city
    validates     :blockname
    #整数のみ許可する
    validates     :phone_number,   numericality: { only_integer: true,  message: 'is invalid. Input only number'}
    #10桁~11桁のみ許可する
    validates     :phone_number,   numericality: { length: in: 10..11,  message: 'is too short'}
  end
end
