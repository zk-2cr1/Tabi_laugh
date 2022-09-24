class Public::SessionsController < Devise::SessionsController
    before_action :reject_member, only: [:create]

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


  private

  def reject_member
    @member = Member.find_by(email: params[:member][:email].downcase)
    if @member
      if (@member.valid_password?(params[:member][:password]) && (@member.active_for_authentication? == true))
        flash[:error] = "退会済みです。"
        redirect_to new_member_session_path
      end
    else
        flash[:error] = "必須項目を入力してください。"
    end
  end

end