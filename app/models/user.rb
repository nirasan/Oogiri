class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :favorites_from, class_name: Favorite, foreign_key: :from_user_id
  has_many :favorites_to,   class_name: Favorite, foreign_key: :to_user_id
  has_many :favorite_users,  through: :favorites_from, source: :to_user
  has_many :favorited_users, through: :favorites_to,   source: :from_user

  validates :name, presence: true

  def favoriting?(user)
    self.favorites_from.where(to_user:user).any?
  end
end
