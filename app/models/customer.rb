class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :address, :city, :state, :district, presence: true, if: :persisted?
  validates :zip_code, :address_number, presence: true, if: :persisted?

  has_many :orders

  has_enumeration_for :state, create_helpers: true

  def to_s
    name.present? ? name : email
  end
end