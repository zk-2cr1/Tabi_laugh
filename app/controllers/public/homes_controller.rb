class Public::HomesController < ApplicationController
  def top
    @post = Post.order('id DESC').page(params[:page]).per(10)
  end

end
