class UserDashboardController < ApplicationController
  before_action :require_login

  def index
    @filter_options = ["All Chops", "Category", "My Chops"]
    if params[:filter_option] == "Category" && params[:category_id]
      @chops = Chop.where(category_id: params[:category_id])
    elsif params[:filter_option] == "My Chops" && current_user
      @chops = current_user.user_chops.map(&:chop)
    else
      @chops = Chop.all
    end
    @chop = @chops.sample
  end

  def randomize
    # Get all chops from the database, or filter by category if specified
    chops = params[:category_id] ? Chop.where(category_id: params[:category_id]) : Chop.all

    # Randomize the chops and render the result
    @random_chop = chops.sample
    render 'randomize'
  end
end

