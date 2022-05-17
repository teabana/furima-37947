class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
  end

  private

  def product_params
    params.require(:product).permit(
      :name, :price, :detail, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_day_id, :image
    ).merge(:user_id current_user.id)
  end

end
