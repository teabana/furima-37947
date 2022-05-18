class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all.order(created_at: 'DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
  end

  
  private

  def product_params
    params.require(:product).permit(:name, :price, :detail, :category_id, :status_id, :shipping_cost_id, :prefecture_id,
                                    :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
