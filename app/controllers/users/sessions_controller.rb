# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  #CSRF保護を無効にする。
  #React試行時の臨時対応
  skip_before_action :verify_authenticity_token
  request_to :json

  # GET /resource/sign_in
  def new
    #  super do
    #   if request.format.json?
    #      render :json => {
    #       'status' => 'ok',
    #       'csrf_token' => form_authenticity_token,
    #       'result' => {
    #          'user' => {
    #           'id' => @user.id,
    #           'email' => @user.email
    #          }
    #       }
    #      } and return
    #  end
  end

  # POST /resource/sign_in
  def create
    # super do
    #   if request.format.json?
    #     render :json => {
    #       'csrf_param' => request_forgery_protection_token,
    #       'csrf_token' => form_authenticity_token
    #     }
    #     return
    #   end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
   def after_sign_in_path_for(resource)
      root_path
   end
end
