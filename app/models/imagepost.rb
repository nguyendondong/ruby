class Imagepost < ApplicationRecord
    mount_uploader :photo, PhotoUploader
    belongs_to :post
  
end