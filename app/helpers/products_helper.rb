module ProductsHelper
  def product_first_image_for_list(product)
    if product.product_shots.any?
      image_tag(product.product_shots.first.image(:small), class: 'img-rounded', width: 120)
    end
  end
end