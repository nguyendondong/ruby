class Post < ApplicationRecord
   
    belongs_to :user
    has_many:avatars
    mount_uploader :avatar, AvatarUploader
   
end
