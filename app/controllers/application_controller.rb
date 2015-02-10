class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# def current_user
#    return nil if session[:user_id].blank?
#    @current_user ||= User.find(session[:user_id])
#  end
#  helper_method :current_user


  before_action :configure_devise_params, if: :devise_controller?

  private

  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name]
  end
  
end
