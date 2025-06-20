require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }

  context 'Authenticated user' do
    before { login(user) }

    describe 'POST #create' do
      context 'with valid parameters' do
        it 'saves a new answer in the database' do
          count = question.answers.count
          post :create, params: { question_id: question.id, answer: { body: 'Test answer body' } }
          expect(question.answers.count).to eq count + 1
        end

        it 'redirects to the question show page' do
          post :create, params: { question_id: question.id, answer: { body: 'Test answer body' } }
          expect(response).to redirect_to question_path(question)
        end
      end
    end
  end
end
