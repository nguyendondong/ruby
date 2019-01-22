class Post < ApplicationRecord
   
    belongs_to :user
    has_many:avatars
    has_many:itemphotos
    accepts_nested_attributes_for :item_photos, allow_destroy: true, reject_if: proc { |attributes| attributes['photo'].blank? }
    mount_uploaders :avatars, AvatarUploader
   
end
