class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :phone, :role, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :phone, :password, :password_confirmation, :current_password) }
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def admin_filter
      redirect_to root_path unless current_user && current_user.is_admin?
  end

  def make_user
    if current_user
      current_user.admin = false
      current_user.save
      flash[:success] = "You are now a normal user."
    else
      flash[:error] = "You are not logged in."
    end
    redirect_to root_path
  end

  def make_admin
    if current_user
      current_user.admin = true
      current_user.save
      flash[:success] = "You are now an admin."
    else
      flash[:error] = "You are not logged in."
    end
    redirect_to root_path
  end

end
