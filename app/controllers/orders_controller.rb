class OrdersController < ApplicationController
  before_action :ensure_buyer, :index

  def index
    @purchase_destination = PurchaseDestination.new
    @product = Product.find(params[:item_id])
  end

  def create
    @purchase_destination = PurchaseDestination.new(destination_params)
    @product = Product.find(params[:item_id])
    if @purchase_destination.valid?
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  
  def destination_params
    params.require(:purchase_destination).permit(
      :postal_code, :prefecture_id, :city, :blockname, :building, :phone_number
    ).merge(
      user_id: current_user.id, product_id: params[:item_id], token: params[:token]
    )
    # binding.pry
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:   @product.price,
      card:   destination_params[:token],
      currency:   'jpy'
    )
  end

  def ensure_buyer
    @product = Product.find(params[:item_id])
    @purchase_order = @product.purchase_order
    redirect_to root_path if @purchase_order != nil
  end
end
