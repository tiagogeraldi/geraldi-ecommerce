class CustomerMailer < ApplicationMailer
  def tracking_code(shipping)
    @shipping = shipping

    mail to: shipping.order_item.order.customer.email, subject: I18n.t('product_sent')
  end
end
