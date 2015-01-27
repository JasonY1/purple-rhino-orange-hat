class CreateEdibles < ActiveRecord::Migration
  def change
    create_table :edibles do |t|
      t.string :name
      t.text :description
      t.string :type
      t.decimal :thc
      t.string :image_url
      t.string :link
      t.integer :inventory
      t.decimal :price, precision: 8, scale: 2
      t.string :slug

      t.timestamps
    end
  end
end
