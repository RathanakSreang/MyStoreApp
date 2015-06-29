class Admin::StoresController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_store  
  before_action :check_store_owner_admin  
  layout "admin/application"

  def show    
  end

  def edit
    @store.create_about unless @store.about
  end

  def update
    if @store.update_attributes store_params      
      flash[:success] = "Update Success"      
        #redirect_to admin_stores_setting_path
        redirect_to admin_stores_setting_url subdomain: @store.sub_domains.first.name
    else
      flash.now[:danger] = "Update Fail"
      render "edit"
    end
  end

  def destroy
    
  end

  private
  def store_params
    params.require(:store).permit :id, :name, :icon, :icon_cache,
                                  sub_domains_attributes: [:id, :name],
                                  user_stores_attributes: [:id, :user_id]
  end
end
