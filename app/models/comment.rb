class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  validates :rate, inclusion: { in: 0..3 }
  validates :user_id, uniqueness: { scope: [:answer_id] }

  after_save :update_answer_sum_of_rate
  after_destroy :update_answer_sum_of_rate

  def update_answer_sum_of_rate
    sum_of_rate = Comment.where(answer:self.answer).group(:answer).sum(:rate).values.first
    self.answer.update(sum_of_rate: sum_of_rate)
  end

  scope :includes_for_user_list, -> { includes(:answer => [:user, {:question => :user}]) }

  scope :recent, -> { order('updated_at DESC') }
end
