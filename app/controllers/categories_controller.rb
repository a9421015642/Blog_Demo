class CategoriesController < ApplicationController

  def index 
    @categories = Category.all
    @articles = Article.all
  end

  def new 
    @categories = Category.all
    @articles = Article.all
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
     if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

 private 
  def  category_params
    params.require(:category).permit(:title)
  end

end
