class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    render:index
  end

  def create
    @category = Category.new(
      name: params[:category][:name]
    )
    @category.save
    redirect_to "/categories"
  end

end
