class FixShippingOrderItems < ActiveRecord::Migration
  def change
    drop_table :shipping_order_items

    change_table :shippings do |t|
      t.references :order_item, foreign_key: true, index: true
    end
  end
end
