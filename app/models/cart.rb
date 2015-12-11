class Cart < ActiveRecord::Base
  validates :product_id, :user_id, :quantiy, presence: true
  
  belongs_to :product
  belongs_to :user

  def to_s
    product_id
  end
end
