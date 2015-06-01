class Answer < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :question
  has_many :comments

  enumerize :category, in: %i(baka shul black metaphor other), default: :other

  validates :body, :presence => true
  validates :category, :presence => true
end
