class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.omniauth(env['omniauth.auth'])
    log_in user
    redirect_to posts_path
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
