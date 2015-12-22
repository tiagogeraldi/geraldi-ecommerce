class Product < ActiveRecord::Base
  validates :name, :price, :category, :brand, presence: true
  validates :name, uniqueness: :category

  belongs_to :category
  belongs_to :brand

  has_many :carts
  has_many :product_shots

  accepts_nested_attributes_for :product_shots, allow_destroy: true

  def to_s
    name
  end
end
