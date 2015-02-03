class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def all
    @product = Product.order(:title)
  end
end
