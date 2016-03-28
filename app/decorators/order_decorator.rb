class OrderDecorator < Draper::Decorator
  delegate_all

  def pagseguro_shipping
    {
      type_name: 'pac',
      cost: order.shipping_cost,
      address: {
        street:      order.customer.address,
        number:      order.customer.address_number,
        district:    order.customer.district,
        city:        order.customer.city,
        state:       order.customer.state,
        postal_code: order.customer.zip_code
      }
    }
  end
end
