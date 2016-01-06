class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  has_many :shipping_order_items
  has_many :shipping, through: :shipping_order_items
end
