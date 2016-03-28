class Cart < ActiveRecord::Base  
  belongs_to :product
  belongs_to :user

  validates :product_id, :quantity, :session_id, presence: true
  validates :product_id, uniqueness: { scope: :session_id }

  def to_s
    product_id
  end

  def self.shipping_price(cep, carts)
    package = Correios::Frete::Pacote.new

    carts.each do |cart|
      item = Correios::Frete::PacoteItem.new peso:        cart.quantity * cart.product.weight, 
                                             comprimento: cart.quantity * cart.product.depth,
                                             largura:     cart.quantity * cart.product.width,
                                             altura:      cart.quantity * cart.product.height
      package.adicionar_item(item)
    end

    frete = Correios::Frete::Calculador.new cep_origem:  Setting.find_by_name('origin-cep').description,
                                            cep_destino: cep,
                                            encomenda:   package
    frete.calcular_pac
  end
end
