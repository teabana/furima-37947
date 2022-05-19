class OrdersController < ApplicationController
  before_action :ensure_buyer, :index

  def index
    @purchase_order_destination = PurchaseOrderDestination.new
    @product = Product.find(params[:item_id])
  end

  def create
    @purchase_order_destination = PurchaseOrderDestination.new(destination_params)
    @product = Product.find(params[:item_id])
    if @purchase_order_destination.valid?
      pay_item
      @purchase_order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def destination_params
    params.require(:purchase_order_destination).permit(
      :postal_code, :prefecture_id, :city, :blockname, :building, :phone_number
    ).merge(
      user_id: current_user.id, product_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: destination_params[:token],
      currency: 'jpy'
    )
  end

  def ensure_buyer
    @product = Product.find(params[:item_id])
    @purchase_order = @product.purchase_order
    unless @purchase_order.nil?
      return redirect_to new_user_session_path unless user_signed_in?

      redirect_to root_path
    end
  end
end
