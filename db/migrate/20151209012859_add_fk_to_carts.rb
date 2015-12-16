class AddFkToCarts < ActiveRecord::Migration
  def change
    add_foreign_key :carts, :products

    add_index :carts, :product_id
  end
end
