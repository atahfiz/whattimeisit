class ProfilesController < ApplicationController
  
  def show
    @user = Profile.find_by(params[:id])
  end
end
