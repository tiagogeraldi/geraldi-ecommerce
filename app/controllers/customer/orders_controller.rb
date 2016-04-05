class Customer::OrdersController < CustomerController
  def index
    @orders = current_customer.orders.preload(:order_items).order('id DESC')
    @orders = @orders.paginate(page: params[:page])
  end

  def show
    @order = Order.find(params[:id])
  end
end