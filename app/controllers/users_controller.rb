class UsersController < ApplicationController
  before_action :set_user

  def show
    @questions = @user.questions.recent.limit(3)
    @answers = @user.answers.includes_for_user_list.recent.limit(3)
    @comments = @user.comments.includes_for_user_list.recent.limit(3)
  end

  def questions
    @questions = @user.questions.recent.page(params[:page])
  end

  def answers
    @answers = @user.answers.includes_for_user_list.recent.page(params[:page])
  end

  def comments
    @comments = @user.comments.includes_for_user_list.recent.page(params[:page])
  end

  def favorite_users
    @favorite_users = @user.favorite_users.page(params[:page])
  end

  def favorited_users
    @favorited_users = @user.favorited_users.page(params[:page])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
