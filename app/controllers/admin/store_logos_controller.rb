class Admin::StoreLogosController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_store
  before_action :check_store_owner_admin
  before_action :load_store_logo, only: [:show, :edit, :update, :destroy]
  layout "admin/application"  

  def show    
  end

  def index
    @store_logos = @store.store_logos
  end

  def new
    @store_logo = current_user.store.store_logos.build  
  end

  def create
    @store_logo = @store.store_logos.build store_logo_params
    if @store_logo.save
      flash[:success] = "Successful Create"
      redirect_to [:admin, @store_logo]
    else
      flash.now[:danger] = "Fail Create"
      render "new"
    end
  end

  def edit    
  end

  def update
    @store_logo.update_attributes store_logo_params
    flash[:success] = "Successful Update"
    redirect_to [:admin, @store_logo]
  end

  def destroy
    @store_logo.destroy
    flash[:success] = "Successful Delete"
    redirect_to admin_store_logos_path
  end

  private
  def store_logo_params
    params.require(:store_logo).permit :id, :title, :description, :visible, :link,
                                      :logo, :logo_cache
  end

  def load_store_logo
    @store_logo = @store.store_logos.find params[:id]
  end
end
