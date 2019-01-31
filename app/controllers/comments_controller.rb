class CommentsController < ApplicationController
    before_action :find_post

    def index
      @comments=Comment.all
      authorize @comments
    end

    def new
        @comment = @post.comments.build
        authorize @post
      end
    
     def create
      @comment= @post.comments.create(comment_params)
      authorize @post
      if current_user
        @comment.user_id = current_user.id
      else
        @comment.user_id = nil
      end
      redirect_to post_comment_path(@post)
    end
      private
    def comment_params
      params.require(:comment).permit(:name, :content)
    end
    def find_post
        @post=Post.find(params[:post_id])
    end
end
