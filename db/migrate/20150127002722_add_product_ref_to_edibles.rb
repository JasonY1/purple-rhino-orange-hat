class AddProductRefToEdibles < ActiveRecord::Migration
  def change
    add_reference :edibles, :product, index: true
  end
end
