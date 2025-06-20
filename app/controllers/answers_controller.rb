# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params.merge(user: current_user))

    if @answer.save
      redirect_to question_path(@question), notice: 'Your answer was successfully posted.'
    else
      # Переменная @answers нужна для рендеринга шаблона show у вопросов
      @answers = @question.answers.reload
      render 'questions/show', status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
