class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show answer]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    @question.build_topic
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def answer
    @answer = current_user.answers.new(answer_params)

    @answer.save
    redirect_to @question
  end

  private

  def question_params
    params.require(:question).permit(:title, topic_attributes: [:name])
  end

  def answer_params
    params.require(:answer).permit(:ans).merge(question: @question)
  end

  def set_question
    @question ||= Question.find(params[:id])
  end
end
