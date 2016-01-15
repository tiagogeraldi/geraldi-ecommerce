class ChangePriceType < ActiveRecord::Migration
  def change
    remove_column :products, :price
    add_column :products, :price, :float

    remove_column :orders, :shipping_cost
    add_column :orders, :shipping_cost, :float
  end
end
