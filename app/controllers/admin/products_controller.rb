class Admin::ProductsController < AdminController
  before_filter do
    set_klass(Product)
    set_search_attrs(['name', 'description'])
  end

  autocomplete :brand,    :name, full: true
  autocomplete :category, :name, full: true

  private

  def resource_params
    params.require(:product).permit(:name, :description, :height, :width, 
                                    :price, :weight, :depth, :brand_name,
                                    :category_name, :discount,
                                    :news, :special, :promotion, :sold_out,
                                    :stock_code, :factory_code,
                                    product_shots_attributes: [
                                      :id, :image, :_destroy, :product_id
                                    ])
  end
end