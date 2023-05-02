class UsersController < ApplicationController
  def index
    @chops = Chop.all
    render template : "users/new"
  end

  def new
    @user = User.new
    render template: "chops/new"
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/chops"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
