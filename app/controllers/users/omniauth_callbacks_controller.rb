# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end
  def twitter
      callback_from :twitter
  end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
  
  private

  def callback_from(provider)
    provider = provider.to_s
    
    @user = User.find_for_oauth(request.env['omniauth.auth'])
    
    byebug
    
    if @user.persisted?
      # 既存ユーザ
      set_flash_message(:notice, :success, kind: provider) if is_navigational_format?
      sign_in_and_redirect @user, event: :authentification
    else
      #新規ユーザ
      byebug
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  end
end
