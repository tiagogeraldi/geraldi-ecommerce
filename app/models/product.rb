class Product < ActiveRecord::Base
  include BelongsToAutocomplete
  
  validates :name, :price, :category, :brand, presence: true
  validates :depth, :weight, :width, :height, presence: true
  validates :name, uniqueness: :category

  belongs_to :category
  belongs_to :brand

  has_many :carts
  has_many :product_shots
  has_many :order_items

  autocompleteable 'brand' => 'name'
  autocompleteable 'category' => 'name'

  accepts_nested_attributes_for :product_shots, allow_destroy: true

  scope :best_sellers, -> (opts = {}) do
    subquery = OrderItem.select('sum(quantity) as total, product_id').group(:product_id).to_sql

    scoped = Product.joins("JOIN (#{subquery}) order_items on products.id = order_items.product_id")
    scoped = scoped.select("products.*, order_items.total")
    scoped = scoped.order("order_items.total desc")
    scoped = scoped.limit(opts[:limit]) if opts[:limit]
    scoped
  end

  def to_s
    name
  end

  def shipping_price(cep)
    frete = Correios::Frete::Calculador.new cep_origem: Setting.find_by_name('origin-cep').description,
                                            cep_destino: cep,
                                            peso: weight,
                                            comprimento: depth,
                                            largura: width,
                                            altura: height
    frete.calcular_pac
  end
end
