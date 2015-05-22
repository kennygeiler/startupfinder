class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def master
    @accept_posts = Post.where(:accepted => false)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
