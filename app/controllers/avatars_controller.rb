class AvatarsController < ApplicationController
    skip_after_action :verify_authorized
    def destroy
        @avatars = Post.find(params[:post_id])
        if @avatars.avatars.count > 1
            remain_avatars = @avatars.avatars # copy initial avatars
            delete_image = remain_avatars.delete_at(params[:id].to_i) # delete the target image
            delete_image.try(:remove!) # delete image
            @avatars.avatars = remain_avatars # re-assign
            @avatars.save
            redirect_to edit_post_path(@avatars)
          else
            @avatars.remove_avatars!
            @avatars.save
            redirect_to edit_post_path(@avatars)
          end
        end
end