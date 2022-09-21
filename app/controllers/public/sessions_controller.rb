class Public::SessionsController < Devise::SessionsController
  def new_guest
    member = Member.guest
    sign_in member   # ユーザーをログインさせる
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end



  def after_sign_in_path_for(resource)
    mypage_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end


end