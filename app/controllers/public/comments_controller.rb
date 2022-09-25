class Public::CommentsController < ApplicationController
  
  def create
       
       @comment = current_member.comments.new(comment_params)
       @comment.member_id = current_member.id
       if @comment.save
          flash[:success] = "コメントしました"
          redirect_back(fallback_location: root_path)
       else
          flash[:success] = "コメントできませんでした"
          redirect_back(fallback_location: root_path)
       end
  end


  def destroy
       @comment = current_member.comments.find(params[:id])
       if @comment.destroy
         flash[:success] = "削除しました"
          redirect_back(fallback_location: root_path)
       else
          redirect_back(fallback_location: root_path)
       end
  end


  private
  def comment_params
    params.require(:comment).permit(:body, :member_id, :post_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end
end
