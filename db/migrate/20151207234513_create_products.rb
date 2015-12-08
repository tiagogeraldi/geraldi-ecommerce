class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :height
      t.integer :width
      t.integer :depth
      t.integer :weight
      t.decimal :price, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
