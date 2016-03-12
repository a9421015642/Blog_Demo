module CommentsHelper
  def  find_comments_ten
    comments = Comment.where.not(user_id: current_user.id).limit(15).order(' updated_at  DESC')
  end

  def  find_comments_ten_count
    find_comments_ten.count
  end
end
