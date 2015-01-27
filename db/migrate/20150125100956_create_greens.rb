class CreateGreens < ActiveRecord::Migration
  def change
    create_table :greens do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :strain
      t.decimal :thc
      t.string :image_url
      t.string :link
      t.integer :inventory
      t.decimal :ppgram, precision: 8, scale: 2
      t.decimal :ppeighth, precision: 8, scale: 2
      t.decimal :ppquad, precision: 8, scale: 2
      t.decimal :pphalf, precision: 8, scale: 2
      t.decimal :ppoz, precision: 8, scale: 2
      t.string :slug

      t.timestamps
    end
  end
end
