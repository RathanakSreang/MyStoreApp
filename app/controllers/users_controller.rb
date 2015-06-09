class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit image_attributes:[:name]
  end
end
