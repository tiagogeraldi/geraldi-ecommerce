class AddPriceToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :price, :float

    OrderItem.find_each do |item|
      item.price = item.product.price
      item.save
    end
  end
end
