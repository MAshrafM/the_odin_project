class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts
  has_many :comments
  has_many :requested_friendships, foreign_key: :request_from_id, class_name: "Friendship", dependent: :destroy
  has_many :requested_friends, through: :requested_friends, source: :request_from
  has_many :received_friendships, foreign_key: :request_to_id, class_name: "Friendship", dependent: :destroy
  has_many :received_friends, through: :received_friendships, source: :request_to
end
