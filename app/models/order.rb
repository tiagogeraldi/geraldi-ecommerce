class Order < ActiveRecord::Base
  belongs_to :customer

  has_many :order_items

  accepts_nested_attributes_for :order_items, allow_destroy: true

  def total
    order_items.map(&:product).sum(&:price)
  end
end
