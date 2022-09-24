class Admin::MembersController < ApplicationController
   before_action :authenticate_admin!

  def index
    @members = Member.all.page(params[:page]).per(10)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_members_path
  end


    private

  def member_params
    params.require(:member).permit(:name, :nick_name, :ntroduction, :email, :is_deleted)
  end
end
