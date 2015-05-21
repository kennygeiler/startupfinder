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
    @posts = Post.order(:cached_votes_total => :desc)
    if request.xhr?
      render partial: 'post_listings', locals: {posts: @posts}, layout: false
    end
  end

  def week
    @posts = Post.week.order(:cached_votes_total => :desc)
    if request.xhr?
      render partial: 'post_listings', locals: {posts: @posts}, layout: false
    end
  end

  def month
    @posts = Post.month.order(:cached_votes_total => :desc)
    if request.xhr?
      render partial: 'post_listings', locals: {posts: @posts}, layout: false
    end
  end

  def show
    @post = Post.find(params[:id])
    #this will be the feedback area
  end

  def upvote
    @post = Post.find(params[:id])
    if current_user.voted_for? @post
      redirect_to posts_path
    else
      @post.upvote_by current_user, :vote_weight => current_user.vote_weight_score
      if current_user.id == @post.user_id
        @post.user.increase_karma(10)
        redirect_to posts_path
      else
        @post.user.increase_karma(1)
        redirect_to posts_path
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id, :hiring, :staff_pick, :description)
  end

end
