class CategoriesController < ApplicationController

  def index 
    @categories = Category.all
    @articles = Article.all
  end
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @articles = Article.where(category_id: @category.id)
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

  def edit
    @categories = Category.all
    @category =  Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])    
      
      if @category.update!(category_params)
      redirect_to categories_path  
    else
      render :edit
    end 
  end

 private 
  def  category_params
    params.require(:category).permit(:title)
  end

end
