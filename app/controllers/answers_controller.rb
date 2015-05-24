class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_question, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = Answer.all.page(params[:page]).per(3)
  end

  def show
  end

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
        format.html { redirect_to [@question, @answer], notice: 'Answer was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to [@question, @answer], notice: 'Answer was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to question_answers_url @question, notice: 'Answer was successfully destroyed.' }
    end
  end

  private

  def set_question
    @question = current_user.questions.find(params[:question_id])
  end

  def set_answer
    @answer = @question.answers.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :category)
  end
end
