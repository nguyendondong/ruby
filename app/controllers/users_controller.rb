class UsersController < ApplicationController
    def admin
        @posts = Post.all
        @users = User.all
        authorize @users
    end
    def update
        authorize @user
        respond_to do |format|
          if @user.update(update_post_params)
            format.html { redirect_to @user, notice: 'Product was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

end
