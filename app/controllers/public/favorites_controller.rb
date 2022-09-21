class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!

  def create
    @favorite = Favorite.new(member_id: current_member.id, post_id: params[:post_id])
    @favorite.save
    redirect_to request.referer
  end

  def destroy
    @favorite = Favorite.find_by(member_id: current_member.id, post_id: params[:post_id])
    @favorite.destroy
    redirect_to request.referer
  end
end