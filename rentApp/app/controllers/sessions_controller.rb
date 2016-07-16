class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to "/"
    else
      flash[:error] = "The password or e-mail entered is incorrect. Please try again"
      redirect_to signin_path
    end
  end

  def delete
    logout
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
