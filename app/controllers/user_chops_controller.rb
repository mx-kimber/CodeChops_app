class UserChopsController < ApplicationController
  before_action :authenticate_user

  def index
    @user_chops = current_user.user_chops
  end

  def new
    @user_chop = current_user.user_chops.build
  end

  def show
    @user_chop = current_user.user_chops.find(params[:id])
  end

  def create
    @user_chop = current_user.user_chops.build(user_chop_params)

    if @user_chop.save
      redirect_to user_chops_path, notice: "The problem has been saved."
    else
      render :new
    end
  end

end
