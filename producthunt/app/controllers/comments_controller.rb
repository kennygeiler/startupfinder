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
    if current_user.voted_for? @comment
      redirect_to post_path(@comment.feedback.post)
    else
      @comment.upvote_by current_user
      if current_user.id == @comment.feedback.post.user_id
        @comment.user.increase_karma(10)
        redirect_to post_path(@comment.feedback.post)
      else
        @comment.user.increase_karma(1)
        redirect_to post_path(@comment.feedback.post)
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, :feedback_id)
  end
end
