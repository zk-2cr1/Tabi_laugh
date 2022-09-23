class Public::PostsController < ApplicationController
    before_action :authenticate_member!, only: [:edit, :update, :destroy]
    before_action :current_member, only: [:edit, :update, :destroy]

    def new
      @post = Post.new
      @categories = Category.all
    end


    def index
      @posts = Post.all
      @post = Post.new
      @categories = Category.all
      if params[:category_id]
          @category = @categories.find(params[:category_id])
          all_posts = @category.posts
      else
          all_posts = Post.includes(:category)
      end
      @posts = all_posts.page(params[:page]).per(12)
      @all_posts_count = all_posts.count
    end


    def show
      @post = Post.find(params[:id])
      @comments = @post.comments                  #投稿詳細に関連付けてあるコメントを全取得
      @comment = current_member.comments.new      #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
    end


    def edit
      @post = Post.find(params[:id])
    end


    def create
      @post = Post.new(post_params)
      @post.member_id = current_member.id

       if @post.save
          redirect_to posts_path(@post)
       else
          @posts = Post.all
          @category = Category.all
          render 'index'
       end
    end


    def update
      @post = Post.find(params[:id])
       if @post.update(post_params)
         redirect_to post_path
       else
         render 'edit'
       end
    end


    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end


    def hashtag
      @member = current_member
      @tag = Hashtag.find_by(hashname: params[:name])
      @posts = @tag.posts
      # @post  = @tag.posts.page(params[:page])
      # @comment    = Comment.new
      # @comments   = @posts.comments
    end


    def search
      @posts = Post.search_for(params[:keyword], params[:method]).page(params[:page]).per(10)
    end

    private

    def post_params
      params.require(:post).permit(:title, :body, :image, :member_id, :category_id)
    end

end