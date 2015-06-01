class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question
  before_action :set_answer
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = current_user.comments.build(answer: @answer)
  end

  def edit
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.answer = @answer

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@question,@answer], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@question, @answer, @comment] }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@question, @answer], notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: [@question, @answer, @comment] }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to question_answer_url(@question, @answer), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
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
