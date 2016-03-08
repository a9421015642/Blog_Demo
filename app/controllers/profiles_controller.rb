class ProfilesController < ApplicationController
 include  SessionsHelper

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
  end

  private

  def profile_params
    params.require(:profile).permit(:chinesename, :englishname, :nickname ,:gender ,:birthday  , :address , :phone)
  end

end
