class ArticlesController < ApplicationController
  include SessionsHelper
  
  def index
    @categories = Category.all
    @articles = Article.all
     if params[:search]
        @article_search = Article.search(params[:search]).order("created_at DESC")
        render :search
      else
        @article_search = Article.all.order('created_at DESC')
      end
  end

  def show
    @categories = Category.all
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments
    @comment_article = Comment.where(article_id: @article.id)
    @comment_article_count = @comment_article.count
    @like = Like.new
    @likes = Like.where(article_id: params[:id])
  end

  def article_comments
    @categories = Category.all
    # @article = Article.find(params[:id])
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

  def edit
    @categories = Category.all
    @article =  Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])    
      
      if @article.update!(article_params)
      redirect_to article_path  
    else
      render :edit
    end 
  end

  def destroy
    @article = Article.find(params[:id])
    @comment_article = Comment.where(article_id: @article.id)
    @like_article = Like.where(article_id: @article.id)
    
      if @article.destroy!
        @comment_article.each do |t|
          t.destroy!
        end
        @like_article.each do |t|
          t.destroy!
        end
      redirect_to articles_path
    end
  end

 private 
  def  article_params
    params.require(:article).permit(:title , :content, :category_id)
  end

end
