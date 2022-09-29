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

  #ユーザーの論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def reject_member
    @member = Member.find_by(email: params[:member][:email])
    if @member
           #入力されたパスワードが正しいことを確認
      if @member.valid_password?(params[:member][:password]) && !@member.is_deleted
        flash[:error] = "退会済みです。"
        redirect_to new_member_session_path
      else
        flash[:error] = "必須項目を入力してください。"
      end
    end
  end

end
