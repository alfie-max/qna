class QuestionsController < ApplicationController
  before_action :set_topic, only: %i[create]

  def index
    @questions = Question.all
  end

  def new; end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @question = Question.includes(:answers, :topic, :author).find(params[:id])
  end

  def answer
    @question = Question.find(params[:id])
    current_user.answers.create(answer_params)
    redirect_to @question
  end

  private

  def question_params
    params.require(:question).permit(:title).merge(topic: @topic)
  end

  def answer_params
    params.require(:answer).permit(:ans).merge(question: @question)
  end

  def set_topic
    if params[:topic_id].present?
      @topic = Topic.find(params[:topic_id])
    elsif params[:new_topic].present?
      @topic = Topic.create(name: params[:new_topic])
    else
      flash.alert = I18n.t('topic.required')
      redirect_to new_question_path and return
    end
  end
end
