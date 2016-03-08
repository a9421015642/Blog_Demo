class ArticlesController < ApplicationController

  def index
    @categories = Category.all
    @articles = Article.all
  end
  def new
    @categories = Category.all
    @articles = Article.all
    @article = Article.new
  end
  def create
    article = Article.new(article_params)
    article.user = current_user
     if article.save
      redirect_to root_path
    else
      render :new
    end
  end

 private 
  def  article_params
    params.require(:article).permit(:title , :content)
  end

end
