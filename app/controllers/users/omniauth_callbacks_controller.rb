class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController



  def linkedin

    @user = User.find_for_linkedin_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Linkedin"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success_enter_credentials", :kind => "Linkedin"
      session["uid"] = @user.uid
      session["provider"] = @user.provider
      session["name"] = @user.name
      redirect_to new_user_registration_url
    end
  end

end
