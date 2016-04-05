class Customer::CheckoutsController < ApplicationController
  before_filter :save_session_id, :authenticate_customer!
  skip_before_filter :verify_authenticity_token, only: :notify

  def index
    order = Order.create_from_session_carts(session, current_customer, session[:cep])

    if order.errors.any?
      redirect_to customer_carts_path, alert: order.errors.full_messages.join('. ')
    else
      payment = PagSeguro::PaymentRequest.new
      payment.reference = order.id
      payment.notification_url = notify_customer_checkouts_path(only_path: false)
      payment.redirect_url = customer_checkouts_done_path(only_path: false)

      order.order_items.includes(:product).each do |item|
        payment.items << item.decorate.pagseguro_item
      end

      payment.shipping = PagSeguro::Shipping.new(order.decorate.pagseguro_shipping)

      response = payment.register

      if response.errors.any?
        raise response.errors.join("\n")
      else
        redirect_to response.url
      end
    end
  end

  def notify
    transaction = PagSeguro::Transaction.find_by_notification_code(params[:notificationCode])

    if transaction.status.paid?
      order = Order.find(transaction.reference)
      order.paid!
      order.save
    end

    render nothing: true, status: 200
  end

  def done
  end

  private

  def save_session_id
    session[:old_session_id] = session.id
  end
end