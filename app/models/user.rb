class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :posts
    has_many :comments
    belongs_to :avatar
    mount_uploader:avatar, AvatarUploader
    def admin?
      role == "admin"
    end
    def guest?
      role == "guest"
    end 
      
end
