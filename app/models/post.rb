class Post < ApplicationRecord
   
    belongs_to :user,  :optional => true
    has_many:avatars
    has_many:comments
    mount_uploaders :avatars, AvatarUploader
   
end
