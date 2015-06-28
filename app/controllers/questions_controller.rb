class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:edit, :update, :destroy]

  def index
    @questions = Question.includes(:user).category_is(params[:category]).page(params[:page])
  end

  def show
    @question = Question.includes(:answers => :user).find(params[:id])
  end

  def new
    @question = current_user.questions.build
  end

  def edit
  end

  def create
    @question = current_user.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'お題投稿に成功しました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'お題編集に成功しました。' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'お題削除に成功しました。' }
    end
  end

  private

  def set_question
    @question = current_user.questions.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :category, :image)
  end
end
