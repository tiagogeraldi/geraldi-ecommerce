class Admin::CustomersController < AdminController
  before_filter do
    set_klass(Customer)
    @readonly = true
  end

  private

  def resource_params
    params.require(:customer).permit(:user_id, :name, :address, :city, :state, :zip_code, :phone)
  end
end