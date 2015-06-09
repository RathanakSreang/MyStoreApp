class RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    #super
    if update_resource current_user, params
      flash[:success] = "Successful Updated"
      redirect_to current_user
    else
      flash.now[:danger] = "Updated Fail"
      render "edit"
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  def update_resource resource, params
    if resource.encrypted_password.blank?
      resource.update_without_password user_without_password_params
    else
      resource.update_with_password user_with_password_params
    end
  end

  private

  def user_without_password_params
    user_with_password_params.except :current_password
  end

  def user_with_password_params    
    params.require(:user).permit :name, :dob, :gender, :email, :current_password,
     :password, :password_confirmation, address_attributes: [:phone, :house_no,
     :street_no, :village, :commune, :district, :province_id],
     image_attributes: [:name]
  end
end
