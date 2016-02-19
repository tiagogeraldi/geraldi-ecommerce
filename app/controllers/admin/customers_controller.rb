class Admin::CustomersController < AdminController
  before_filter do
    set_klass(Customer)
    set_search_attrs(['name', 'email', 'city', 'state', 'zip_code'])
    clean_password_fields(:customer)
  end

  private

  def resource_params
    params.require(:customer).permit(:user_id, :name, :email, :address, :city, :state, 
                                     :zip_code, :phone, :password, :password_confirmation)
  end
end