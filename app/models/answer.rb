class Answer < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  belongs_to :question
  has_many :comments

  enumerize :category, in: %i(baka shul black metaphor other), default: :other

  validates :body, :presence => true
  validates :category, :presence => true

  def sum_of_rate
    self.comments.map{|comment| comment.rate}.sum
  end
end
