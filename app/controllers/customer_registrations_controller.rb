class CustomerRegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, only: [:create, :update]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u| 
      u.permit(:user_id, :name, :email, :address, :city, :state, 
               :zip_code, :phone, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.for(:account_update) do |u| 
      u.permit(:user_id, :name, :email, :address, :city, :state, 
               :zip_code, :phone, :password, :password_confirmation,
               :current_password)
    end
  end
end