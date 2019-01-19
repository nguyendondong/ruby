class UsersController < ApplicationController
    def admin
        @posts = Post.all
        @users = User.all
        authorize @users
    end

end
