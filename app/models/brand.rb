class Brand < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :products, foreign_key: :codigomarca

  def to_s
    name
  end
end
