class Brand < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :products

  def to_s
    name
  end
end
