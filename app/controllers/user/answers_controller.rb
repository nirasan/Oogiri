class User::AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question
  before_action :set_answer, only: [:edit, :update, :destroy]
  before_action :set_referer, only: [:new]

  def new
    @answer = @question.answers.build
  end

  def edit
  end

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.html { redirect_to get_referer, notice: 'ボケ投稿に成功しました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to [@question, @answer], notice: 'ボケ編集に成功しました。' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to @question, notice: 'ボケ削除に成功しました。' }
    end
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = current_user.answers.find_by!(id: params[:id], question: @question)
  end

  def answer_params
    params.require(:answer).permit(:body, :category)
  end
end
