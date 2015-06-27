class Answer < ActiveRecord::Base
  extend Enumerize

  default_value_for :sum_of_rate, 0

  belongs_to :user
  belongs_to :question
  has_many :comments

  @@categories = %w(baka shul black metaphor other)
  enumerize :category, in: @@categories, default: :other

  validates :body, :presence => true
  validates :category, :presence => true

  scope :category_is, -> (category) {
    if !category.blank? && @@categories.include?(category)
      where(category: category)
    end
  }
end
