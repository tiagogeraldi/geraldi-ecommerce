class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  def require_admin
    unless current_user.admin?
      redirect_to new_session_url
      return false
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected

  def layout_by_resource
    if devise_controller? || self.class.parent == Admin
      "admin"
    else
      "application"
    end
  end
end
