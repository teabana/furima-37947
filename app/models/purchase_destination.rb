class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecrure_id, :city, :blockname, :phone_number, :purchaseorder_id

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

  def save
    #購入者情報を保存し、変数purchaseorderに代入する。
    purchase_order = PurchaseOrder.create(user_id: current_user.id, product_id: parasms[:id] )
    #配送先情報を保存する
    Destination.create(postal_code: postal_code, prefecrure_id: prefecrure_id, city: city, blockname: blockname, phone_number: phone_number, purchaseorder_id: purchase_order.id)
  end
end
