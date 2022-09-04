class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to root_path, notice: "Log In Successful"
    else
      redirect_to login_path, alert: "Invalid Email or Password"
    end
  end 

  def destroy 
    session.delete(:user_id)
    redirect_to root_path, alert: "You have Logged Out."
  end

end
