class Admin::CommentsController < ApplicationController
  def index
     @comments = Comment.all.page(params[:page]).per(10)
  end

  def destroy
       @comment = Comment.find(params[:id])
       if @comment.destroy
          redirect_back(fallback_location: root_path)
       else
          redirect_back(fallback_location: root_path)
       end
  end
end
