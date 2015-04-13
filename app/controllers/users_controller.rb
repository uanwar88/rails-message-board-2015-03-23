class UsersController < ApplicationController
  before_validation :downcase_email
  
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user
      redirect_to root_path
    else

      render "new"
    end
  end

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

  private

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end
end
