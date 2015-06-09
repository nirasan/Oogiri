class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer

  def self.answer_ranking
    ranking_data = Comment.group(:answer).sum(:rate)
    rank = 0
    before = -1
    ranking_data
      .keys
      .sort{|a, b| ranking_data[b] <=> ranking_data[a]}
      .map{|answer|
        rate = ranking_data[answer]
        if before != rate then
          before = rate
          rank += 1
        end
        {answer: answer, rank: rank, rate: rate}
      }
  end
end
