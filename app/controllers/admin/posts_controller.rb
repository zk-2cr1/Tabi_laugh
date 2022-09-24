class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).per(10)
  end

  def show
      @post = Post.find(params[:id])
      @comments = @post.comments                  #投稿詳細に関連付けてあるコメントを全取得
  end

  def destroy
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to admin_top_path
  end


   private

    def post_params
      params.require(:post).permit(:title, :body, :image, :member_id, :category_id)
    end


end
