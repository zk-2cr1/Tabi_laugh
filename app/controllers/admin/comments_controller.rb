class Admin::CommentsController < ApplicationController
  def index
  end

  def show
  end

  def destroy
    @comment = current_member.comments.find(params[:id])
       if @comment.destroy
          redirect_back(fallback_location: root_path)
       else
          redirect_back(fallback_location: root_path)
       end
  end
end
