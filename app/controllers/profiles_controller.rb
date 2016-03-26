class ProfilesController < ApplicationController
 include  SessionsHelper

  def show
    @categories = Category.all
    @articles = Article.all 
    @profile = Profile.find_by(user_id: params[:id])

  end
  
  def new
    @profile  = Profile.new 
    @categories = Category.all
    @articles = Article.all
  end
  def create
    profile = Profile.new(profile_params)
    profile.user = current_user
    if profile.save!
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
    @profile =  Profile.find_by(user_id: params[:id])
  end
  def update
    @profile = Profile.find(params[:id])    
      
      if @profile.update!(profile_params)
      redirect_to profile_path  
    else
      render :edit
    end 
  end

  private

  def profile_params
    params.require(:profile).permit(:chinesename, :englishname, :nickname ,:gender ,:birthday  , :address , :phone)
  end

end
