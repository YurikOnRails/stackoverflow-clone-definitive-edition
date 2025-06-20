# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }

  context 'Authenticated user' do
    before { login(user) }

    describe 'POST #create' do
      context 'with valid parameters' do
        it 'saves a new answer in the database' do
          expect {
            post :create, params: { question_id: question.id, answer: attributes_for(:answer) }
          }.to change(question.answers, :count).by(1)
        end

        it 'redirects to the question show page' do
          post :create, params: { question_id: question.id, answer: attributes_for(:answer) }
          expect(response).to redirect_to question_path(question)
        end
      end

      context 'with invalid parameters' do
        it 'does not save the answer' do
          expect {
            post :create, params: { question_id: question.id, answer: attributes_for(:answer, :invalid) }
          }.not_to change(Answer, :count)
        end

        it 'renders the question show template' do
          post :create, params: { question_id: question.id, answer: attributes_for(:answer, :invalid) }
          expect(response).to render_template 'questions/show'
        end
      end
    end
  end
end
