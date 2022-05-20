class PurchaseOrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :blockname, :building, :phone_number,
                :purchase_order_id, :token

  with_options presence: true do
    validates     :user_id
    validates     :product_id
    validates     :token
    # 3桁-4桁の整数の組み合わせのみ許可する
    validates     :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates     :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates     :city
    validates     :blockname
    # 整数のみ許可する
    validates     :phone_number, numericality: { only_integer: true, message: 'is invalid. Input only half-width number' }
  end
  # 10桁~11桁のみ許可する
  validates :phone_number, length: { in: 10..11, message: 'is too long or too short (10-11 digits)' }

  def save
    # 購入者情報を保存し、変数purchaseorderに代入する。
    purchase_order = PurchaseOrder.create(user_id: user_id, product_id: product_id)
    # 配送先情報を保存する
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, blockname: blockname,
                       building: building, phone_number: phone_number, purchase_order_id: purchase_order.id)
  end
end
