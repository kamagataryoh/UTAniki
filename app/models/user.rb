class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :riders, dependent: :destroy
         has_many :likes, dependent: :destroy
         has_many :liked_riders, through: :likes, source: :rider
         has_many :comments, dependent: :destroy
         def already_liked?(rider)
    self.likes.exists?(rider_id: rider.id)
  end     
end 
