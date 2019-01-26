class Post < ApplicationRecord
   
    belongs_to :user
    has_many:avatars
    has_many:itemphotos
    mount_uploaders :avatars, AvatarUploader
   
   
end
