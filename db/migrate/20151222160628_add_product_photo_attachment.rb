class AddProductPhotoAttachment < ActiveRecord::Migration
  def change
    add_attachment :product_shots, :image
  end
end
