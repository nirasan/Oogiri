class Question < ActiveRecord::Base
  extend Enumerize

  enumerize :category, in: %i(man animal landscape illustration other), default: :man

  belongs_to :user
end
