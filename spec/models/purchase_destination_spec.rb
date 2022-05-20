require 'rails_helper'

RSpec.describe PurchaseOrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @purchase_order_destination = FactoryBot.build(:purchase_order_destination, user_id: user.id, product_id: product.id)
    sleep(0.1)
  end

  describe '商品購入' do
    context '購入可能な場合' do
      it 'トークンと発送先情報が正しく入力されていれば購入できる' do
        expect(@purchase_order_destination).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @purchase_order_destination.building = ''
        expect(@purchase_order_destination).to be_valid
      end
    end
    context '購入不可能な場合' do
      it 'トークンが空だと購入できない' do
        @purchase_order_destination.token = ''
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと購入できない' do
        @purchase_order_destination.postal_code = ''
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが3桁-4桁で構成されていないと購入できない' do
        @purchase_order_destination.postal_code = '12-45678'
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeが全角だと購入できない' do
        @purchase_order_destination.postal_code = '１２３-３４５６'
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'prefecture_idが空だと購入できない' do
        @purchase_order_destination.prefecture_id = ''
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが0だと購入できない' do
        @purchase_order_destination.prefecture_id = 0
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @purchase_order_destination.city = ''
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'blocknameが空だと購入できない' do
        @purchase_order_destination.blockname = ''
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include("Blockname can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @purchase_order_destination.phone_number = ''
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字以外が含まれると購入できない' do
        @purchase_order_destination.phone_number = 'abc12345あいう'
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include('Phone number is invalid. Input only half-width number')
      end
      it 'phone_numberが9桁以下だと購入できない' do
        @purchase_order_destination.phone_number = Faker::Number.number(digits: 9)
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include('Phone number is too long or too short (10-11 digits)')
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @purchase_order_destination.phone_number = Faker::Number.number(digits: 12)
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include('Phone number is too long or too short (10-11 digits)')
      end
      it 'user_idが空だと購入できない' do
        @purchase_order_destination.user_id = nil
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空だと購入できない' do
        @purchase_order_destination.product_id = nil
        @purchase_order_destination.valid?
        expect(@purchase_order_destination.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
