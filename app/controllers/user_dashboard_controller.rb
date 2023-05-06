class UserDashboardController < ApplicationController
  before_action :require_login

  def index
    @filter_options = ["All Chops", "Category", "My Chops"]

    if params[:filter_option] == "Category" && params[:category_id].present?
      @chops = Chop.where(category_id: params[:category_id])
    elsif params[:filter_option] == "My Chops" && current_user
      @chops = current_user.user_chops.map(&:chop)
    else
      @chops = Chop.all
    end

    if params[:show_solution] == "true" && params[:chop_id].present?
      @show_solution = true
      @chop = Chop.find_by(id: params[:chop_id])
    else
      @show_solution = false
      @chop = @chops.sample
    end
  end



  def randomize
    chops = params[:category_id].present? ? Chop.where(category_id: params[:category_id]) : Chop.all

    @random_chop = chops.sample

    respond_to do |format|
      format.js
    end
  end

  def save_chop
    chop = Chop.find(params[:id])

    user_chop = current_user.user_chops.new(chop: chop, rating: params[:rating])

    if user_chop.save
      redirect_to user_dashboard_index_path, notice: "Chop saved successfully."
    else
      redirect_to user_dashboard_index_path, alert: "Failed to save chop."
    end
  end
end
