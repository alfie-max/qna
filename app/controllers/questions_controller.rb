class QuestionsController < ApplicationController
  def index

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

  private

  def question_params
    params.require(:question).permit(:title, topic_attributes: [:name])
  end
end
