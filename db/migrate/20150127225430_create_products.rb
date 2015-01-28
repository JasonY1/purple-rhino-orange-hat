class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :type
      t.string :strain
      t.decimal :thc
      t.string :image_url
      t.string :link
      t.integer :inventory
      t.decimal :ppunit, precision: 8, scale: 2
      t.decimal :ppgram, precision: 8, scale: 2
      t.decimal :ppeighth, precision: 8, scale: 2
      t.decimal :ppquad, precision: 8, scale: 2
      t.decimal :pphalf, precision: 8, scale: 2
      t.decimal :ppoz, precision: 8, scale: 2
      t.string :slug
      t.boolean :show, default: true

      t.timestamps
    end
  end
end
