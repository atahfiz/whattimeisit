class SessionsController < ApplicationController
  
  include SessionsHelper
  
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
  
    if @user && @user.authenticate(params[:session][:password])
      #Login
      session[:user_id] = @user.id
      flash[:success] = "You have successfully login"
      redirect_to @user
    else
      flash[:danger] = "Invalid Username/Password"
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end