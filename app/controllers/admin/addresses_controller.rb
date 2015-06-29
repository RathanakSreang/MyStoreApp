class Admin::AddressesController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_store  
  before_action :check_store_owner_admin  
  layout "admin/application"

  def show
    @address = @store.address
  end

  def edit
    @address = @store.address
  end

  def update
    @address = @store.address
    if @address.update_attributes address_params
      flash[:success] = "Successful update"
      redirect_to admin_stores_addresses_path
    else
      flash.now[:danger] = "Fail update"
      render "new"
    end
  end

  private
  def address_params
    params.require(:address).permit :id, :phone, :house_no, :street_no, :village,
      :commune, :district, :province_id
  end
end
