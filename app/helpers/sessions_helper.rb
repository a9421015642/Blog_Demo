module SessionsHelper
    #login
  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def logged_in?
    !!current_user
  end

  def  current_user_grade?
    if current_user
      @current_user_grade = User.find_by(id: current_user.id , grade: 1)
    end
    @current_user_grade
  end

  def find_admin
    @admin = User.find_by_name("admin")
  end

end
