class SessionsController < ApplicationController
  skip_before_filter :require_login, only: [:create]

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to return_point
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
