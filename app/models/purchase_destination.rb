class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :blockname, :building, :phone_number, :purchaseorder_id

  with_options presence: true do
    #3桁-4桁の整数の組み合わせのみ許可する
    validates     :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates     :prefecture_id
    validates     :city
    validates     :blockname
    #整数のみ許可する
    validates     :phone_number,   numericality: { only_integer: true,  message: 'is invalid. Input only number'}
    #10桁~11桁のみ許可する
    validates     :phone_number,   length: { in: 10..11,  message: 'is too short'}
  end

  def save
    #購入者情報を保存し、変数purchaseorderに代入する。
    purchase_order = PurchaseOrder.create(user_id: user_id, product_id: product_id )
    #配送先情報を保存する
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, blockname: blockname, phone_number: phone_number, purchase_order_id: purchase_order.id)
  end
end
