class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts
         has_many :comments ,dependent: :destroy
         has_many :likes ,dependent: :destroy

         def role?
            if self.has_role? :admin
              return "Admin"
            else
              return "user"
            end
         end
end
