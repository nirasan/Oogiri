class UsersController < ApplicationController
  before_action :set_user

  def show
    @questions = @user.questions.limit(3)
    @answers = @user.answers.includes_for_user_list.limit(3)
    @comments = @user.comments.includes_for_user_list.limit(3)
  end

  def questions
    @questions = @user.questions.page(params[:page])
  end

  def answers
    @answers = @user.answers.includes_for_user_list.page(params[:page])
  end

  def comments
    @comments = @user.comments.includes_for_user_list.page(params[:page])
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
