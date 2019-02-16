class CommentsController < ApplicationController
    before_action :find_post
    skip_before_action :verify_authenticity_token

  def index
      @comments=Post.comment.all
      authorize @comments
    end
 
  def new
        @comment = @post.comments.build
        authorize @comment
  end

 def create
      @comment= @post.comments.new(comment_params)
      authorize @comment
      if current_user
        @comment.user_id = current_user.id
        @comment.name = current_user.username
      else
        @comment.user_id = nil
        @comment.name = nil

      end
      @comment.save
      respond_to do |format|
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.js { render layout: false }
    end
  end
  def edit
    
    @comment=Comment.find(params[:id])
    authorize @comment
  end


  def update
    @comment=Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(update_comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  def destroy
    @comment=Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    authorize @comment
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
      format.js { render layout: false }
    end
  end
  
      private
    def comment_params
      params.require(:comment).permit(:name, :content)
    end
    def update_comment_params
      params.require(:comment).permit(:content)
    end
    def find_post
        @post=Post.find(params[:post_id])
    end

end
