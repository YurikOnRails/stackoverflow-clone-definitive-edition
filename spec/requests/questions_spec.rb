# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Questions', type: :request do
  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }

  context 'when authenticated user' do
    before { sign_in user }

    describe 'GET #new' do
      before { get new_question_path }

      it 'assigns a new Question to @question' do
        expect(assigns(:question)).to be_a_new(Question)
      end

      it 'renders new view' do
        expect(response).to render_template :new
      end
    end

    describe 'GET #edit' do
      before { get edit_question_path(question) }

      it 'assigns the requested question to @question' do
        expect(assigns(:question)).to eq question
      end

      it 'renders edit view' do
        expect(response).to render_template :edit
      end
    end

    describe 'POST #create with valid attributes' do
      let(:question_params) { attributes_for(:question) }
      let(:request) { post questions_path, params: { question: question_params } }

      it 'saves a new question in the database' do
        expect { request }.to change(user.questions, :count).by(1)
      end

      it 'redirects to show view' do
        request
        expect(response).to redirect_to assigns(:question)
      end
    end

    describe 'POST #create with invalid attributes' do
      let(:invalid_question) { attributes_for(:question, :invalid) }
      let(:request) { post questions_path, params: { question: invalid_question } }

      it 'does not save the question' do
        expect { request }.not_to change(Question, :count)
      end

      it 're-renders new view' do
        request
        expect(response).to render_template :new
      end
    end

    describe 'PATCH #update with valid attributes' do
      let(:update_params) { { title: 'new title', body: 'new body text' } }

      before { patch question_path(question), params: { question: update_params } }

      it 'changes question attributes' do
        question.reload
        expect(question.title).to eq 'new title'
        expect(question.body).to eq 'new body text'
      end

      it 'redirects to updated question' do
        expect(response).to redirect_to question
      end
    end

    describe 'PATCH #update with invalid attributes' do
      let(:invalid_question) { attributes_for(:question, :invalid) }

      before { patch question_path(question), params: { question: invalid_question } }

      it 'does not change question attributes' do
        old_title = question.title
        old_body = question.body
        question.reload
        expect(question.title).to eq old_title
        expect(question.body).to eq old_body
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end

    describe 'DELETE #destroy' do
      let!(:question) { create(:question, user: user) }

      it 'deletes the question' do
        expect { delete question_path(question) }.to change(Question, :count).by(-1)
      end

      it 'redirects to index' do
        delete question_path(question)
        expect(response).to redirect_to questions_path
      end
    end
  end
end
