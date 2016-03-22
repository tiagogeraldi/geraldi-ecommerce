class Customer::CheckoutsController < ApplicationController
  before_filter :save_session_id, :authenticate_customer!
  skip_before_filter :verify_authenticity_token, only: :notify

  def index
    order = Order.create_from_session_carts(session, current_customer)

    payment = PagSeguro::PaymentRequest.new
    payment.reference = order.id
    payment.notification_url = notify_customer_checkouts_path(only_path: false)
    payment.redirect_url = customer_order_path(order, only_path: false)

    order.order_items.includes(:product).each do |item|
      payment.items << {
        id: item.id,
        description: item.product.name,
        amount:      item.product.price,
        weight:      item.product.weight
      }
    end

    response = payment.register

    if response.errors.any?
      raise response.errors.join("\n")
    else
      redirect_to response.url
    end
  end

  def notify
    binding.pry
    transaction = PagSeguro::Transaction.find_by_notification_code(params[:notificationCode])

    if transaction.status.paid?
      order = Order.find(transaction.reference)
      order.paid!
      order.save
    end

    render nothing: true, status: 200
  end

  private

  def save_session_id
    session[:old_session_id] = session.id
  end
end