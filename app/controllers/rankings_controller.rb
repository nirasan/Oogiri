class RankingsController < ApplicationController
  def index
    @rankings = Ranking
      .includes(:answer => [:user, {:question => :user}])
      .page(params[:page]).per(3)
  end
end
