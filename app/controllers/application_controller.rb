class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# def current_user
#    return nil if session[:user_id].blank?
#    @current_user ||= User.find(session[:user_id])
#  end
#  helper_method :current_user
  
end
