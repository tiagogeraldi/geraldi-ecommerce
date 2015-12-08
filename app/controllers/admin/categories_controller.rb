class Admin::CategoriesController < AdminController
  before_filter do
    set_klass(Category)
    set_search_attrs(['name'])
  end

  private

  def resource_params
    params.require(:category).permit(:name)
  end
end
