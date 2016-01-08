class Product < ActiveRecord::Base
  include BelongsToAutocomplete
  
  validates :name, :price, :category, :brand_name, :category_name, presence: true
  validates :name, uniqueness: :category

  belongs_to :category
  belongs_to :brand

  has_many :carts
  has_many :product_shots
  has_many :order_items

  autocompleteable 'brand' => 'name'
  autocompleteable 'category' => 'name'

  accepts_nested_attributes_for :product_shots, allow_destroy: true

  def to_s
    name
  end
end
