class UsersController < ApplicationController
  def index
  end
  def show
    @categories = Category.all
    @articles = Article.all 
    @profile = Profile.find_by(user_id: params[:id])

  end
  def new 
    @user = User.new
    @categories = Category.all
    @articles = Article.all 
  end
  def create
    @user = User.new(user_params)
    @categories = Category.all
    @articles = Article.all 
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 
  def  user_params
    params.require(:user).permit(:name ,:password)
  end

end
