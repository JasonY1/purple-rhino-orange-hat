class StoreController < ApplicationController
  def all
    @product = Product.all
  end
end
