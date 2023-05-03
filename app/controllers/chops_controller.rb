class ChopsController < ApplicationController
  before_action :require_login

  def index
    if params[:category_id].present?
      @tasks = Task.joins(:categories).where(categories: { id: params[:category_id] })
    else
      @tasks = Task.where(user_id: current_user.id)
    end
    render :index
  end

  def show
    @chop = Chop.find_by(id: params[:id])
    render :show
  end

  def create    # dont forget to add if category_id is present
  @chop = Chop.new(
    problem: params[:chop][:problem],
    solution: params[:chop][:solution],
    user_id: current_user.id
    )
    @chop.save
    redirect_to "/chops" #not sure if correct

  end

  def edit
    @chop = Chop.find_by(id: params[:id])
    render :edit
  end

  # def update
  #   chop = Chop.find_by(id: params[:id]
  #   chop.problem = params[:chop][:problem]
  #   chop.solution = params[:chop][:solution]
  #   chop.save
  #     redirect_to "/chops/#{@chop.id}" #not sure if correct
  #   )
  # end
end
