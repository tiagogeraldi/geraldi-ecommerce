class OrderItemDecorator < Draper::Decorator
  delegate_all

  def pagseguro_item
    {
        id:          id,
        description: product.name,
        amount:      product.price,
        weight:      product.weight
      }
  end
end
