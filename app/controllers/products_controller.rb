class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def shipping_price
    product = Product.find(params[:id])
    @shipping_price = product.shipping_price(params[:shipping][:cep])
  end
end