class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_product, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to     item_path
    else
      render :edit
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :price, :detail, :category_id, :status_id, :shipping_cost_id, :prefecture_id,
                                    :shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
