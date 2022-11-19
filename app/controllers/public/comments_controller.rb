class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.member_id = current_member.id
    @comment.save
  end

  def destroy
   @comment = Comment.find(params[:id])
   @comment.destroy
  end


  private
  def comment_params
    params.require(:comment).permit(:body, :member_id, :post_id)
  end
end
