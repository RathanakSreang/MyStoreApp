class Admin::AboutsController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_store  
  before_action :check_store_owner_admin  
  layout "admin/application"

  def show
    @about = @store.about
  end

  def edit
    @about = @store.about
  end

  def update
    @about = @store.about
    if @about.update_attributes about_params
      flash[:success] = "Successful update"
      redirect_to admin_stores_abouts_path
    else
      flash.now[:danger] = "Fail update"
      render "new"
    end
  end

  private
  def about_params
    params.require(:about).permit :id, :content, :fb_link, :tw_link, :in_link,
                                  :gg_link
  end
end
