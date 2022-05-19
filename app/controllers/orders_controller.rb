class OrdersController < ApplicationController

  def index
    @purchase_destination = PurchaseDestination.find(new)
    @product = Product.find(parasm[:id])
  end
end
