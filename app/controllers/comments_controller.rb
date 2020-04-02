class CommentsController < ApplicationController
    def index
    end
  
    def create
      @comment = Comment.new    
      @comment.content = params[:content]
      @comment.post_id = params[:format]
      @comment.save
      redirect_to post_path(params[:format])
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_back fallback_location: root_path
    end
end
