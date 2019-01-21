class ImagepostController < ApplicationController
    def destroy
        @imagepost = imagepost.find(params[:id])
        item = @imagepost.item
        @imagepost.destroy
        respond_to do |format|
          format.html {redirect_to item_url(item), notice: 'Item photo was successfully destroyed.'}
        end
      end
end
