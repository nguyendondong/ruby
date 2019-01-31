class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

    def admin
        @posts = Post.all
        @users = User.all
        @comments= Comment.all
        authorize @users
    end
    def show
      authorize @user
    end
    def edit
      authorize @user
   end
    def update
      authorize @user
      respond_to do |format|
        if @user.update(edit_user_params)
          format.html { redirect_to @user , notice: 'User was successfully updated.' }
          format.json { render :userview, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
    def userview
      @users = User.all.page(params[:page]).per(5)
      authorize @users
    end
    def destroy
      @user.destroy
      authorize @user
      respond_to do |format|
        format.html { redirect_to userview_path, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    private
    def set_user
      @user = User.find(params[:id])
    end
    def edit_user_params
      params.require(:user).permit(:email,:role, :username,:avatar)
    end

end
