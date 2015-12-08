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
                                    :news, :views, :special, :promotion, :sould_out,
                                    :stock_code, :factory_code)
  end
end