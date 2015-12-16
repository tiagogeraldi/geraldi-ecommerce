class ChangeCartQuantity < ActiveRecord::Migration
  def change
    rename_column :carts, :quantiy, :quantity
  end
end
