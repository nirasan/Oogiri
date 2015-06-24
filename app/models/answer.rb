class Answer < ActiveRecord::Base
  extend Enumerize

  default_value_for :sum_of_rate, 0

  belongs_to :user
  belongs_to :question
  has_many :comments

  enumerize :category, in: %i(baka shul black metaphor other), default: :other

  validates :body, :presence => true
  validates :category, :presence => true
end
