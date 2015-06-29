class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all    
    user = User.from_omniath request.env["omniauth.auth"]
    if user.persisted?
      flash[:notice] = "Sign In successfully"
      # sign_in_and_redirect user
      sign_in user      
      render "callback", layout: false
    else
      #session["devise.user_attributes"] = user.attributes
      redirect_to new_user_registration_url
    end
  end
  alias_method :twitter, :all
  alias_method :facebook, :all
  alias_method :google_oauth2, :all
end
