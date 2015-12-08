class Admin::BrandsController < AdminController
  before_filter do
    set_klass(Brand)
    set_search_attrs(['name'])
  end

  private

  def resource_params
    params.require(:brand).permit(:name)
  end
end
