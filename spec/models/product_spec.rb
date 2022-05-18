require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品可能' do
      it '必須情報を全て入力すると出品できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品不可' do
      it 'imageが空ではできない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'detailが空では出品できない' do
        @product.detail = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Detail can't be blank")
      end
      it 'category_idが空では出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では出品できない' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end
      it 'shipping_cost_idが空では出品できない' do
        @product.shipping_cost_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it 'prefecture_idが空では出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_day_idが空では出品できない' do
        @product.shipping_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceの入力値が299以下では出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceの入力値が9999999999以上では出品できない' do
        @product.price = Faker::Number.number(digits: 11)
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceの入力が半角数字以外では出品できない' do
        @product.price = "９９９９"
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end
    end
  end
end
