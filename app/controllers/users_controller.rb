class UsersController < SecureApplicationController
    
    layout 'layouts/application'
  
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
   
   def edit
    @user = User.find(params[:id])
   end
   
   def update
       @user = User.find(params[:id])
       
       if @user.update(user_params)
           #Update Successful
           flash[:success] = "Profile Updated"
           redirect_to @user
       else
           #Fail
           flash[:danger] = "Fail to update"
           render 'edit'
       end
   end
   
    def show
     @user = User.find(params[:id])
    end
   
   private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation,
                                    profile_attributes: [:id, :location, :birthdate])
    end
end