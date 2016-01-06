class CreateShippingOrderItems < ActiveRecord::Migration
  def change
    create_table :shipping_order_items do |t|
      t.references :shipping, index: true, foreign_key: true
      t.references :order_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
