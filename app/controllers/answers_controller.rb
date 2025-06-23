# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question
  before_action :set_answer, only: %i[destroy show]
  before_action :authorize_author!, only: :destroy

  def create
    @answer = @question.answers.new(answer_params.merge(user: current_user))

    respond_to do |format|
      if @answer.save
        format.turbo_stream
        format.html { redirect_to question_path(@question), notice: t('.success') }
      else
        @answers = @question.answers.reload
        format.html { render 'questions/show', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@question), notice: t(".success")
  end

  def show; end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = @question.answers.find(params[:id])
  end

  def authorize_author!
    redirect_to question_path(@question), alert: t("common.errors.access_denied") unless current_user.id == @answer.user_id
  end

  def answer_params
    params.expect(answer: [ :body ])
  end
end
