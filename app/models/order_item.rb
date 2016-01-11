class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  has_many :shippings

  accepts_nested_attributes_for :shippings, allow_destroy: true
end
