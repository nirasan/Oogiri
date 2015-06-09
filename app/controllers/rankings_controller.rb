class RankingsController < ApplicationController
  def index
    @rankings = Kaminari.paginate_array(Comment.answer_ranking).page(params[:page]).per(3)
  end
end
