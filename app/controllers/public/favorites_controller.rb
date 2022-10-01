class Public::FavoritesController < ApplicationController
  before_action :authenticate_member!
  before_action :set_post

  def create
    @favorite = Favorite.new(member_id: current_member.id, post_id: params[:post_id])
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(member_id: current_member.id, post_id: params[:post_id])
    @favorite.destroy
  end


  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
