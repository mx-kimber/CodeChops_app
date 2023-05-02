class ChopsController < ApplicationController

  def index
    @chops = Chop.all
    render :index
  end

  def show
    @chop = Chop.find_by(id: params[:id])
    render: show
  end

  def create

    @chop = Chop.new(
      problem: params[:chop][:problem],
      solution: params[:chop][:solution],
      category_id: current_user.id
    )
    @pet.save
    redirect_to "/chops/#{@chop.id}"

    def edit
      @chop = Chop.find_by(id: params[:id])
      render :edit
    end


end
