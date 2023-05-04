class ChopsController < ApplicationController
  before_action :require_login

  def index
    if params[:category_id].present?
      @chops = Chop.joins(:category).where(categories: { id: params[:category_id] })

    else
      @chops = Chop.all
    end
    render :index
  end

  def show
    @chop = Chop.find_by(id: params[:id])
    render :show
  end

  def new
    @chop = Chop.new
  end

  def create
    @chop = Chop.new(
      user_id: current_user.id,
      problem: params[:chop][:problem],
      solution: params[:chop][:solution],
      category_id: params[:chop][:category_id]
    )

    if @chop.save
      redirect_to chop_path(@chop)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @chop = Chop.find_by(id: params[:id])
    render :edit
  end

  def update
    chop = Chop.find_by(id: params[:id])
    chop.problem = params[:chop][:problem]
    chop.solution = params[:chop][:solution]
    chop.save
    redirect_to chop_path(chop)
  end

  def destroy
    chop = Chop.find_by(id: params[:id])
    chop.destroy
    redirect_to chops_path
  end
end
