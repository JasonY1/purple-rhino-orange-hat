class AddProductRefToGreens < ActiveRecord::Migration
  def change
    add_reference :greens, :product, index: true
  end
end
