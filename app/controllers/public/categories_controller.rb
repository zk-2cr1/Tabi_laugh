class Public::CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.all
  end


  private

  def category_params
      params.require(:category).permit(:name)
  end
end
