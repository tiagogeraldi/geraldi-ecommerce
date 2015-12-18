class Admin::CartsController < AdminController
  before_filter do
    set_klass(Cart)
    @readonly = true
  end

  private

  def resource_params
    params.require(:cart).permit(:user_id, :product_id, :quantity)
  end
end