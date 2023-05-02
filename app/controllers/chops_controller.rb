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
      )
      if @chop.save
      redirect_to "/chops/#{@chop.id}" #not sure if correct
      end
    end

    def edit
      @chop = Chop.find_by(id: params[:id])
      render :edit
    end

    def update
      @chop = Chop.find_by(id: params[:id]
      @chop.problem = params[:chop][:problem]
      @chop.solution = params[:chop][:solution]
      if @chop.save
        redirect_to "/chops/#{@chop.id}" #not sure if correct
      end
      )
    end
end
