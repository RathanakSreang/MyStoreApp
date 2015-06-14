class StoresController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_store, only: [:edit, :update]
  before_filter :load_store, except: [:new, :create]
  def show    
  end

  def index
    
  end

  def new
    unless current_user.store
      @store = Store.new
      @store.sub_domains.build
      if current_user.address
        @store.build_address current_user.address.attributes.except :id, :created_at, :updated_at
      else
        @store.build_address
      end
      @store.user_stores.build user_id: current_user.id
    else
      @store =current_user.store
      redirect_to @store
    end
  end

  def create
    @store = Store.new store_params
    if @store.save
      redirect_to admin_url subdomain: @store.sub_domains.first.name#@store
    else
      render "new"
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  def admin
    if @store.users.include? current_user

    else
      if current_user.store
        redirect_to root_path
      else
        redirect_to new_store_url subdomain: false
      end      
    end
  end
  private
  def set_store
    @store = Store.find params[:id]
  end
  def store_params
    params.require(:store).permit :id, :name, address_attributes: [:id,
      :phone, :house_no, :street_no, :village, :commune, :district, :province_id],
      sub_domains_attributes: [:id, :name], user_stores_attributes: [:user_id]
  end
end
