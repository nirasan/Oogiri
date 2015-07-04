class Question < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  has_many :answers

  @@categories = %w(man animal landscape illustration other)
  enumerize :category, in: @@categories, default: :man

  has_attached_file :image,
    :storage => :database,
    :styles => { :medium => "300x300>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  validates :title, :presence => true
  validates :image, :presence => true

  scope :category_is, -> (category) {
    if !category.blank? && @@categories.include?(category)
      where(category: category)
    end
  }

  scope :recent, -> { order('updated_at DESC, id DESC') }
end
