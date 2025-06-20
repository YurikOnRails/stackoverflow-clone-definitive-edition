# frozen_string_literal: true

require 'rails_helper'

feature 'Author can delete question', %q(
  In order to remove irrelevant or wrong questions
  As an authenticated author
  I'd like to be able to delete my question
) do
  given(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given!(:question) { create(:question, user: user) }

  scenario 'Author deletes their question' do
    sign_in(user)
    visit question_path(question)
    click_on 'Delete question'
    expect(page).to have_content 'Question was successfully deleted.'
    expect(page).not_to have_content question.title
  end

  scenario 'Non-author tries to delete question' do
    sign_in(other_user)
    visit question_path(question)
    expect(page).not_to have_link 'Delete question'
  end

  scenario 'Unauthenticated user tries to delete question' do
    visit question_path(question)
    expect(page).not_to have_link 'Delete question'
  end
end
