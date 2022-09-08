class Public::SessionsController < Devise::SessionsController
  def new_guest
    member = Member.guest
    sign_in member   # ユーザーをログインさせる
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
