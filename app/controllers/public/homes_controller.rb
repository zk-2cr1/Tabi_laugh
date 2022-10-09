class Public::HomesController < ApplicationController
  def top
    @post = Post.publish.order('id DESC').page(params[:page]).per(10)
  end

end
