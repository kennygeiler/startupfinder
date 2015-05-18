class PostsController < ApplicationController

  def new
    @post = Post.new
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
    #this will be the feedback area
  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id, :hiring)
  end

end
