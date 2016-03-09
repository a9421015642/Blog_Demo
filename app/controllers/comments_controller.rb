class CommentsController < ApplicationController
    include SessionsHelper
    def create
    @article = Article.find(params[:article_id])   

    @comment = @article.comments.build(params.require(:comment).permit(:content))
    @comment.user = current_user
    if @comment.save
      redirect_to article_path(@article)
    else
      render 'article/show'
    end
  end
  
end
