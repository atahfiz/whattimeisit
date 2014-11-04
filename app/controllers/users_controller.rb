class UsersController < ApplicationController
  
  def index
    if params[:name]
      @user = User.find_by(name: params[:name])
    else
      @user = User.all  
    end
  end

  def new
    @user = User.new
  end
  
   def create
     @user = User.new(user_params)
     
     if @user.save
       #success
       redirect_to user_path(@user)
     else
       #fail
       render 'new'
     end
   end
   
    def show
    @user = User.find(params[:id])
    end
   
   private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end