class Customer::CartsController < ApplicationController
  def index
    @carts = Cart.where(session_id: session.id).includes(:product)
  end

  def create
    Cart.create session_id: session.id, 
                product_id: params[:product_id],
                quantity:   params[:quantity] || 1

    redirect_to customer_carts_path
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.quantity = params[:cart][:quantity] if params[:cart][:quantity].to_i > 0
    @cart.save

    respond_to do |format|
      format.html { redirect_to customer_carts_path }
      format.js   { render nothing: true }
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    redirect_to customer_carts_path
  end
end