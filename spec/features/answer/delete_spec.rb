# frozen_string_literal: true

require 'rails_helper'

feature 'Author can delete answer', %q(
  In order to remove irrelevant or wrong answers
  As an authenticated author
  I'd like to be able to delete my answer
) do
  given(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given!(:question) { create(:question) }
  given!(:answer) { create(:answer, question: question, user: user) }

  scenario 'Author deletes their answer' do
    sign_in(user)
    visit question_path(question)
    within "#answer-#{answer.id}" do
      click_on 'Delete answer'
    end
    expect(page).to have_content 'Answer was successfully deleted.'
    expect(page).not_to have_content answer.body
  end

  scenario 'Non-author tries to delete answer' do
    sign_in(other_user)
    visit question_path(question)
    within "#answer-#{answer.id}" do
      expect(page).not_to have_link 'Delete answer'
    end
  end

  scenario 'Unauthenticated user tries to delete answer' do
    visit question_path(question)
    within "#answer-#{answer.id}" do
      expect(page).not_to have_link 'Delete answer'
    end
  end
end
