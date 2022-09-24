class Public::HomesController < ApplicationController
  def top
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

  def new_guest
  end
end
