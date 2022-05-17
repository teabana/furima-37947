class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    
  end

  def new
    # @product = product.new
  end

  def create
  end

end
