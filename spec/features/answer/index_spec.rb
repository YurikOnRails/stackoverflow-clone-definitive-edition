# frozen_string_literal: true

require 'rails_helper'

feature 'User can view answers', %q(
  In order to find solutions to questions
  As any user
  I'd like to be able to see the list of answers for a question
) do
  given!(:user) { create(:user) }
  given!(:question) { create(:question) }
  given!(:answers) { create_list(:answer, 3, question: question, user: user) }

  scenario 'User sees list of answers for a question' do
    visit question_path(question)
    
    expect(page).to have_content question.title
    expect(page).to have_content question.body
    
    answers.each do |answer|
      expect(page).to have_content answer.body
    end
  end

  scenario 'User sees answers content' do
    visit question_path(question)
    
    answers.each do |answer|
      expect(page).to have_content answer.body
    end
  end

  scenario 'Answer has validations' do
    invalid_answer = build(:answer, body: nil)
    expect(invalid_answer).not_to be_valid
    expect(invalid_answer.errors[:body]).to include("can't be blank")
  end

  scenario 'Answer belongs to question and user' do
    answer = create(:answer, question: question, user: user)
    expect(answer.question).to eq question
    expect(answer.user).to eq user
  end
end
