# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: %i(index show)
  before_action :find_question, only: %i(show edit update destroy)
  before_action :authorize_author!, only: %i(edit update destroy)

  def index
    @questions = Question.all
  end

  def show
    @answers = @question.answers
    @answer = @question.answers.build
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to @question, notice: "Your question successfully created."
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice: "Question was successfully deleted."
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def authorize_author!
    redirect_to root_path, alert: "You are not authorized." unless current_user.id == @question.user_id
  end

  def question_params
    params.expect(question: [ :title, :body ])
  end
end
