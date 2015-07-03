class User::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question
  before_action :set_answer
  before_action :set_comment, only: [:update, :destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.answer = @answer
    @comment.save
    respond_to do |format|
      format.js
    end
  end

  def update
    @comment.update(comment_params)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = @question.answers.find(params[:answer_id])
  end

  def set_comment
    @comment = current_user.comments.find_by!(answer: @answer, id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :rate)
  end
end
