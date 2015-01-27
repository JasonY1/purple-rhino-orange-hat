class AddProductRefToConcentrates < ActiveRecord::Migration
  def change
    add_reference :concentrates, :product, index: true
  end
end
