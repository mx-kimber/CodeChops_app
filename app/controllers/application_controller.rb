class ApplicationController < ActionController::Base
  before_action :current_user

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

  def chop_params
    params.require(:chop).permit(:problem, :solution, :category_id, :user_id)
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def user_chop_params
    params.require(:user_chop).permit(:chop_id, :rating)
  end
end

