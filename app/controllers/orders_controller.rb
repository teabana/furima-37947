class OrdersController < ApplicationController

  def index
    @purchase_destination = PurchaseDestination.new
    @product = Product.find(params[:item_id])
  end

  def create
    binding.pry
  end

end
