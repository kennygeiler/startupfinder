class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @feedback = Feedback.find(params[:feedback_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      render 'new'
    end
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    redirect_to post_path(@comment.post_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, :feedback_id)
  end
end
