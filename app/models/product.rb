class Product < ActiveRecord::Base
  validates :name, :price, :category, :brand, presence: true
  validates :name, uniqueness: :category

  belongs_to :category
  belongs_to :brand

  has_many :carts

  def to_s
    name
  end
end
