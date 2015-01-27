class CreateConcentrates < ActiveRecord::Migration
  def change
    create_table :concentrates do |t|
      t.string :name
      t.text :description
      t.string :style
      t.string :strain
      t.decimal :thc
      t.string :image_url
      t.string :link
      t.integer :inventory
      t.decimal :ppgram, precision: 8, scale: 2
      t.string :slug

      t.timestamps
    end
  end
end
