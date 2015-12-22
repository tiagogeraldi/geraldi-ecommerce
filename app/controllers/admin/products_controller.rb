class Admin::ProductsController < AdminController
  before_filter do
    set_klass(Product)
    set_search_attrs(['name', 'description'])
  end

  private

  def resource_params
    params.require(:product).permit(:name, :description, :height, :width, 
                                    :price, :weight, :depth, 
                                    :category_id, :brand_id, :discount,
                                    :news, :special, :promotion, :sould_out,
                                    :stock_code, :factory_code,
                                    product_shots_attributes: [
                                      :id, :image, :_destroy, :product_id
                                    ])
  end
end