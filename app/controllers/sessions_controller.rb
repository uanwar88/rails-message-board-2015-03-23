class SessionsController < ApplicationController
  def login
    @login = 1
  end

  def create
    user = User.find_by_username(params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user] = user
      redirect_to(session[:return_to])
      session[:return_to] = nil
    else
      @message = "Incorrect username or password!"
      render "layouts/message"
    end
  end

  def destroy
    reset_session
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end
end
