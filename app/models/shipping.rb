class Shipping < ActiveRecord::Base
  has_many :shipping_order_items
  has_many :order_items, through: :shipping_order_items
end
