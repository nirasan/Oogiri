class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :favorites, foreign_key: :from_user_id
  has_many :favorite_users, through: :favorites, source: :to_user

  validates :name, presence: true

  def favoriting?(user)
    self.favorites.where(to_user:user).any?
  end
end
