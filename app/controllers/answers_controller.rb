class AnswersController < ApplicationController

  def index
    @answers = Answer
      .includes(:user, {:question => :user})
      .category_is(params[:category])
      .recent
      .page(params[:page])
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = @question.answers.includes(:comments => :user).find(params[:id])
  end
end
