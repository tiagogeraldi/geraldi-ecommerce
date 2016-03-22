class Order < ActiveRecord::Base
  belongs_to :customer

  has_many :order_items

  accepts_nested_attributes_for :order_items, allow_destroy: true

  has_enumeration_for :status, create_helpers: true, with: OrderStatus

  def total
    order_items.map{ |i| i.product.price }.compact.sum
  end

  def self.create_from_session_carts(session, customer)
    order = Order.new(status: OrderStatus::CREATED, customer: customer)

    carts = Cart.where(session_id: session.id)
    carts = Cart.where(session_id: session[:old_session_id]) if carts.blank?

    carts.each do |cart|
      order.order_items << OrderItem.new(product: cart.product, quantity: cart.quantity)
    end

    order.save
    order
  end
end
