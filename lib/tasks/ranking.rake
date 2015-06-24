namespace :ranking do
  desc "ランキング更新"
  task update: :environment do
    Ranking.update_ranking(Ranking.calc_ranking)
  end
end
