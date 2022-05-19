class OrdersController < ApplicationController

  def index
    @purchase_destination = PurchaseDestination.new
    @product = Product.find(params[:item_id])
  end

  def create
    @purchase_destination = PurchaseDestination.new(destination_params)
    # binding.pry
    if @purchase_destination.valid?
      @purchase_destination.save
      redirect_to root_path
    else
      # binding.pry
      @product = Product.find(params[:item_id])
      render :index
    end
  end


  private
  
  def destination_params
    # binding.pry
    params.require(:purchase_destination).permit(:postal_code, :prefecture_id, :city, :blockname, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:item_id])
    # binding.pry
  end
end
