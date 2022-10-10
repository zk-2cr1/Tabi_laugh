class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new
      @categories = Category.all
      if params[:category_id]                                   # urlにcategory_id(params)がある場合
          @category = @categories.find(params[:category_id])    # Categoryのデータベースのテーブルから一致するidを取得
          all_posts = @category.posts                           # category_idと紐づく投稿を取得
      else
          all_posts = Post.includes(:category)                  # 投稿すべてを取得
      end
      @posts = all_posts.page(params[:page]).per(10)
      @all_posts_count = all_posts.count
  end

  def show
      @post = Post.find(params[:id])
      @comments = @post.comments                  #投稿詳細に関連付けてあるコメントを全取得
      @comment_all = @comments.count
      @category = @post.category
  end

  def destroy
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to admin_top_path
  end

  def hashtag
      @tag = Hashtag.find_by(hashname: params[:name])
      @posts = @tag.posts.page(params[:page]).per(10)
  end

   private

    def post_params
      params.require(:post).permit(:title, :body, {image:[]}, :status, :member_id, :category_id)
    end


end
