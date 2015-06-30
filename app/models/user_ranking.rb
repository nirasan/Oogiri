class UserRanking < ActiveRecord::Base
  include UpdateRanking

  belongs_to :user

  def self.calc_ranking
    ranking_data = Comment.group(:answer).sum(:rate)

    user_data = {}
    ranking_data.each do |answer, rate|
      user_data[answer.user_id] ||= 0
      user_data[answer.user_id] += rate
    end

    rank = 0
    before = -1
    user_data
      .keys
      .sort{|a, b| (user_data[b] <=> user_data[a]).nonzero? || (a <=> b)}
      .map{|user_id|
        rate = user_data[user_id]
        if before != rate
          before = rate
          rank += 1
        end
        {user_id: user_id, rank: rank, rate: rate}
    }
  end
end
