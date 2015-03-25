class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers.order(created_at: :asc)
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    if @answer.save
      flash[:notice] = "Question answered!"
      redirect_to question_path(@question)
    else
      flash[:notice] = @answer.errors.full_messages
      render 'questions/show'
    end
  end

  protected

  def answer_params
    params.require(:answer).permit(:description)
  end


end
