namespace :user_ranking do
  desc "ユーザーランキング更新"
  task update: :environment do
    UserRanking.update_ranking(UserRanking.calc_ranking)
  end
end
