class Ranking < ActiveRecord::Base
  include UpdateRanking

  belongs_to :answer

  def self.calc_ranking
    ranking_data = Comment.group(:answer_id).sum(:rate)
    rank = 0
    before = -1
    ranking_data
      .keys
      .sort{|a, b| (ranking_data[b] <=> ranking_data[a]).nonzero? || (a <=> b)}
      .map{|answer_id|
        rate = ranking_data[answer_id]
        if before != rate then
          before = rate
          rank += 1
        end
        {answer_id: answer_id, rank: rank, rate: rate}
      }
  end
end
