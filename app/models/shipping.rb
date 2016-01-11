class Shipping < ActiveRecord::Base
  belongs_to :order_item

  validates :tracking_code, :quantity, presence: true
end
