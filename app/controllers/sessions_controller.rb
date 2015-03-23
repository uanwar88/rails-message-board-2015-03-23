class SessionsController < ApplicationController
  def create
    user = User.find_by_username(params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user] = user
      redirect_to root_path
    else
      @message = "Incorrect username or password!"
      render "layouts/message"
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
