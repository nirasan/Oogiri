class QuestionsController < ApplicationController
  include Paperclip::Storage::Database::ControllerClassMethods

  downloads_files_for :question, :image

  def index
    @questions = Question.includes(:user).category_is(params[:category]).page(params[:page])
  end

  def show
    @question = Question.includes(:answers => :user).find(params[:id])
  end
end
