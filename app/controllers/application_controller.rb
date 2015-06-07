class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

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
