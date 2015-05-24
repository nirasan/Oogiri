class UsersController < ApplicationController
  before_action :set_user, only: [:show, :questions, :answers]

  def show
    @questions = @user.questions.limit(3)
    @answers = @user.answers.limit(3)
  end

  def questions
    @questions = @user.questions.page(params[:page])
  end

  def answers
    @answers = @user.answers.page(params[:page])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
