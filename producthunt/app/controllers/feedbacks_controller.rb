class FeedbacksController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      redirect_to post_path(@feedback.post_id)
    else
      render 'new'
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:question, :post_id)
  end
end
