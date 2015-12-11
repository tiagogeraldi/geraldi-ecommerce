class Admin::CartsController < AdminController
  before_filter do
    set_klass(Cart)
    #set_search_attrs(['user_id'])
  end

  private

  def resource_params
    params.require(:cart).permit(:user_id, :product_id, :quantiy)
  end
end