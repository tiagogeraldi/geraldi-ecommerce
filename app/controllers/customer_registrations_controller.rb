class CustomerRegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u| 
        u.permit(:user_id, :name, :email, :address, :city, :state, 
                 :zip_code, :phone, :password, :password_confirmation)
      end
    end
end