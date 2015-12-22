class ProductShot < ActiveRecord::Base
  belongs_to :product


  has_attached_file :image,
  size: 0.megabyte..1.megabytes,
  styles: { small:    '200>x200>',
            original: '900>x900>',
            medium:   '500>x500>'
          }

  validates_attachment :image, content_type: { 
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] 
  }
end
