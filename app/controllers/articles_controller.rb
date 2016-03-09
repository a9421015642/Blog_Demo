class ArticlesController < ApplicationController
  include SessionsHelper
  def index
    @categories = Category.all
    @articles = Article.all
  end
  def show
    @categories = Category.all
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments
    @comment_article = Comment.where(article_id: @article.id)
    @comment_article_count = @comment_article.count
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
    params.require(:article).permit(:title , :content, :category_id)
  end

end
