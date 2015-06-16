class Admin::StoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_store, only: [:edit, :update]
  before_filter :load_store

  def show
    if @store.users.include? current_user

    else
      if current_user.store
        redirect_to root_path
      else
        redirect_to new_store_url subdomain: false
      end      
    end
  end
end
