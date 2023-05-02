class ChopsController < ApplicationController

  def create
    @chops = Chop.all
    render :index
  end

  def show
    @chop = Chop.find_by(id: params[:id])
    render: show
  end
end
