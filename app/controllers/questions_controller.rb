class QuestionsController < ApplicationController

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.order(created_at: :asc)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question added.'
      redirect_to root_path
    else
      flash[:notice] = @question.errors.full_messages
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question revised.'
      redirect_to question_path(@question)
    else
      flash[:notice] = @question.errors.full_messages
      render :edit
    end
  end

  protected

  def question_params
    params.require(:question).permit(:title, :detail)
  end

end
