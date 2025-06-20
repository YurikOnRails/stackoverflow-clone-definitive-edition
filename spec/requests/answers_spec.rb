# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Answers', type: :request do
  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }

  before { sign_in user }

  describe 'POST /questions/:question_id/answers' do
    context 'with valid parameters' do
      it 'saves a new answer in the database' do
        expect {
          post "/questions/#{question.id}/answers", params: { answer: { body: 'Test answer body' } }
        }.to change(question.answers, :count).by(1)
      end

      it 'redirects to the question show page' do
        post "/questions/#{question.id}/answers", params: { answer: { body: 'Test answer body' } }
        expect(response).to redirect_to question_path(question)
      end
    end
  end
end
