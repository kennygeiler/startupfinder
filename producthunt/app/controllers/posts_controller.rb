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

  def today
    @posts = Post.today.order(:cached_votes_total => :desc)
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
    if request.xhr?
      render layout: "container_only"
    end
  end

  def upvote
    @post = Post.find(params[:id])
    if current_user.voted_for? @post
      if request.xhr?
        render partial: 'vote_count', locals: {post: @post}
      else
        redirect_to posts_path
      end
    else
      @post.upvote_by current_user
      if current_user.id == @post.user_id
        @post.user.increase_karma(10)
        if request.xhr?
          render partial: 'vote_count', locals: {post: @post}
        else
          redirect_to posts_path
        end
      else
        @post.user.increase_karma(1)
        if request.xhr?
          render partial: 'vote_count', locals: {post: @post}
        else
          redirect_to posts_path
        end
      end
    end
  end

  def downvote
    @post = Post.find(params[:id])
    if current_user.voted_for? @post
      current_user.votes.find_by(votable: @post).destroy
      if current_user.id == @post.user_id
        @post.user.increase_karma(-10)
      else
        @post.user.increase_karma(-1)
      end

      if request.xhr?
        render partial: 'vote_count', locals: {post: @post}
      else
        redirect_to posts_path
      end
    else
      if request.xhr?
        render partial: 'vote_count', locals: {post: @post}
      else
        redirect_to posts_path
      end
    end
  end

  def edit
    if current_user.admin
      @post = Post.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link, :user_id, :hiring, :staff_pick, :description, :accepted, :contact_email)
  end

end
