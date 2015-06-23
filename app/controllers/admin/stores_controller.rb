class Admin::StoresController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_store
  before_action :set_store, only: [:edit, :update]
  before_action :check_store_owner_admin  
  layout "admin/application"

  def show    
  end
end
