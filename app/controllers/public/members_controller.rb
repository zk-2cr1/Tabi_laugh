class Public::MembersController < ApplicationController
   before_action :authenticate_member!
   before_action :set_current_member


  def show
      @favorite = Favorite.where(member_id: current_member.id)
      @post = Post.where(member_id: current_member.id).includes(:member).order("created_at DESC").page(params[:page]).per(10)
  end

  def edit
  end

  def update
      if @member.update(member_params)
        redirect_to mypage_path(@member), notice: "更新しました"
      else
        render "edit"
      end
  end

  def unsubscribe
  end

  def withdraw
  end


  private

  def member_params
      params.require(:member).permit(:name, :nick_name, :introduction, :profile_image, :password, :email)
  end

  def set_current_member
      @member = current_member
  end


end