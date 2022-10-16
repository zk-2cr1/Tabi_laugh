# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest,  only: [:update, :destroy]
 
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def after_sign_up_path_for(resource)
    mypage_path
  end
  
  def after_update_path_for(resource)
    mypage_path
  end

  def check_guest
    if resource.email == 'guest@guest.com'
       flash[:danger] = "ゲストユーザーは更新,削除はできません。"
      redirect_to edit_member_registration_path
    end
  end
  
protected 

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end