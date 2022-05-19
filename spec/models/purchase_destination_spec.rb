require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  before do
    purchase_order = FactoryBot.create(:purchase_order)
    @purchase_destination = FactoryBot.build(:purchase_destination, purchaseorder_id: purchase_order.id)
    sleep(0.1)
  end

  describe '商品購入' do
    context '購入可能な場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_destination).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @purchase_destination.building  = ''
        expect(@purchase_destination).to be_valid
      end
    end

    context '購入不可能な場合' do
      it 'postal_codeが空だと購入できない' do
        @purchase_destination.postal_code  = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが3桁-4桁で構成されていないと購入できない' do
        @purchase_destination.postal_code  = '12-45678'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeが全角だと購入できない' do
        @purchase_destination.postal_code  = '１２３-３４５６'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが空だと購入できない' do
        @purchase_destination.prefecture_id  = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @purchase_destination.city  = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'blocknameが空だと購入できない' do
        @purchase_destination.blockname = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Blockname can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @purchase_destination.phone_number  = ''
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁以下だと購入できない' do
        @purchase_destination.phone_number  = Faker::Number.number(digits: 9)
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is too short")
      end
    end
  end
end
