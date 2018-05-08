class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    # @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
