class ShippingOrderItem < ActiveRecord::Base
  belongs_to :shipping
  belongs_to :order_item
end
