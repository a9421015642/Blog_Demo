class LikesController < ApplicationController
  include SessionsHelper
    def create
    @article = Article.find(params[:article_id])   

    @like = @article.likes.build(params.require(:like).permit(:like_notlike))
    @like.user = current_user
    if @like.save
      redirect_to article_path(@article)
    else
      redirect_to article_path(@article)
    end
  end

end
