class UserChopsController < ApplicationController
  before_action :authenticate_user

  def index

    @user = current_user
    @user_chops = @user.user_chops.includes(:chop)

    @chops = Chop.all
    if params[:category_id].present?
      @chops = Chop.where(category_id: params[:category_id])
    end
  end

  def show
    @chop = Chop.find(params[:id])
  end

  def create
    @chop = Chop.find(params[:id])
    @chop.update(rating: params[:rating])
    redirect_to chop_path(@chop)
  end
#come back to this, not sure if correct
  def store
    @chop = Chop.find(params[:id])
    @chop.update(difficulty_level: params[:difficulty_level], stored_by: current_user.id)
    redirect_to chop_path(@chop)
  end

end
