class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites_from.build(to_user_id: params[:to_user_id])
    @result = @favorite.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @favorite = current_user.favorites_from.find(params[:id])
    @result = @favorite.destroy
    respond_to do |format|
      format.js
    end
  end
end
