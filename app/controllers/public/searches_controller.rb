class Public::SearchesController < ApplicationController
  def search
   @model = params[:model]
   if @model == 'member'
      @members = Member.search_for(params[:keyword], params[:method]).page(params[:page]).per(10)
   else
	    @posts = Post.publish.search_for(params[:keyword], params[:method]).page(params[:page]).per(10)
	 end

	end
end
