class Shipping < ActiveRecord::Base
  belongs_to :order_item

  validates :tracking_code, :quantity, presence: true

  after_save :send_email_to_customer

  def send_email_to_customer
    if !self.sent_to_user && self.tracking_code.present? && Rails.env.production?
      CustomerMailer.tracking_code(self).deliver

      self.sent_to_user = true
      save
    end
  end
end
