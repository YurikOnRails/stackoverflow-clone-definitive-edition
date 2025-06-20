# frozen_string_literal: true

require 'rails_helper'

feature 'User can view questions list and question details', %q(
  In order to find interesting questions
  As any user
  I'd like to be able to see the list of questions and view details with answers
) do
  given!(:questions) { create_list(:question, 2) }
  given!(:user) { create(:user) }
  given!(:answer) { create(:answer, question: questions.first, body: 'First answer') }

  scenario 'User sees list of questions' do
    visit questions_path
    expect(page).to have_content questions.first.title
    expect(page).to have_content questions.second.title
  end

  scenario 'User views a question and its answers' do
    visit questions_path
    click_on questions.first.title
    expect(page).to have_content questions.first.title
    expect(page).to have_content questions.first.body
    expect(page).to have_content 'First answer'
  end
end
