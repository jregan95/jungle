class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV['HTTP_AUTH_USER'], password: ENV['HTTP_AUTH_PASS']
  
  def index
    @categories = Category.pluck(:name)
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(category_params)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end