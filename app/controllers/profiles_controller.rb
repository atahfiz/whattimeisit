class ProfilesController < ApplicationController
  def index
    @user = Profile.find(session[:user_id])
  end
end
