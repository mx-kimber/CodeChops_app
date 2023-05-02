class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user
    redirect_to '/login', status: :see_other unless current_user
  end

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this page."
      redirect_to login_path
    end
  end

end
