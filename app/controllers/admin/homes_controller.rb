class Admin::HomesController < ApplicationController
  def top
    # @posts = Post.all.order('id DESC').page(params[:page]).per(10)
    @comments = Comment.all.order('id DESC').page(params[:page]).per(10)
    @posts = Post.page(params[:page])

  end
end

