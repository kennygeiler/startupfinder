class PostsController < ApplicationController

  def new
    if current_user = nil
      redirect_to login_path
    else
      @post = Post.new
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    #this will be the feedback area
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id, :hiring, :staff_pick)
  end

end
