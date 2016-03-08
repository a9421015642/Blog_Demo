module UsersHelper
  def user_profile_find
    @profile = Profile.find_by(user_id: params[:id])
  end
  def user_profile?
    !!user_profile_find
  end
  def user_profile_gender
    if(user_profile_find.gender == 0 )
      gender = "女性"
    else
      gender = "男性"
    end
    gender
  end





end
