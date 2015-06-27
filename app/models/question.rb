class Question < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  has_many :answers

  enumerize :category, in: %i(man animal landscape illustration other), default: :man

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  validates :title, :presence => true
  validates :image, :presence => true

  scope :category_is, -> (category) { if !category.blank? then where(category: category) end }
end
