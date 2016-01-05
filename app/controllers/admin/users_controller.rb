class Admin::UsersController < AdminController
  before_filter do
    set_klass(User)
    set_search_attrs(['name', 'email'])
    clean_password_fields
  end

  private

  def resource_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def clean_password_fields
    if params[:user] && params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end
end