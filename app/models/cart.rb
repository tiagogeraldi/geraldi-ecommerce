class Cart < ActiveRecord::Base  
  belongs_to :product
  belongs_to :user

  validates :product_id, :quantity, :session_id, presence: true
  validates :product_id, uniqueness: { scope: :session_id }

  def to_s
    product_id
  end
end
