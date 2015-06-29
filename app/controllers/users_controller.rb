class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_store
  def show
    @user = User.find params[:id]
  end
end
