class Customer < ActiveRecord::Base
  validates :user_id, :name, presence: true
  
  belongs_to :user

  def to_s
    name
  end
end