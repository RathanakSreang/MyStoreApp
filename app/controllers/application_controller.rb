class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  #put in before_filter
  def load_store
    if request.subdomain.present? && request.subdomain != "www"
      sub_domain = SubDomain.find_by_name request.subdomain
      @store = sub_domain.store
    else
      redirect_to root_path
    end
  end

  def check_store_owner_admin
    unless @store.users.include? current_user  
      if current_user.store
        redirect_to root_path
      else
        redirect_to new_store_url subdomain: false
      end      
    end
  end

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) << :name, :dob, :gender
    # devise_parameter_sanitizer.for(:account_update) do |u|
    #   u.permit :name, :dob, :gender, :email, :current_password, :password,
    #   :password_confirmation, address_attributes: [:phone, :house_no,
    #   :street_no, :village, :commune, :district, :province_id]
    # end
    devise_parameter_sanitizer.for(:sign_up) do |u| 
      u.permit :name, :dob, :gender, :email, :password, :password_confirmation,
      address_attributes: [:phone, :house_no, :street_no, :village, :commune,
      :district, :province_id]
    end
  end
end
