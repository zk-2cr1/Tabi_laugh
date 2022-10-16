class Public::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest,  only: [:update, :destroy]

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