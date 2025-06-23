require 'rails_helper'

RSpec.feature 'Best answer', type: :feature, js: true do
  let!(:user) { create(:user) }
  let!(:question) { create(:question, user: user) }
  let!(:answer1) { create(:answer, question: question) }
  let!(:answer2) { create(:answer, question: question) }
  let!(:answer3) { create(:answer, question: question) }

  before do
    login(user)
    visit question_path(question)
  end

  scenario 'Question author selects best answer' do
    within "#answer-#{answer2.id}" do
      click_on 'Mark as best'
    end

    within '.answers' do
      expect(first('.answer')).to have_content answer2.body
      expect(page).to have_selector(".answer:first-child[data-answer-id='#{answer2.id}']")
      expect(page).to have_selector(".answer:first-child .best-answer-badge")
    end
  end

  scenario 'Question author changes best answer' do
    # Select first best answer
    within "#answer-#{answer1.id}" do
      click_on 'Mark as best'
    end

    # Select different best answer
    within "#answer-#{answer3.id}" do
      click_on 'Mark as best'
    end

    within '.answers' do
      expect(first('.answer')).to have_content answer3.body
      expect(page).to have_selector(".answer:first-child[data-answer-id='#{answer3.id}']")
      expect(page).to have_selector(".answer:first-child .best-answer-badge", count: 1)
      expect(page).to have_selector("#answer-#{answer1.id} .best-answer-badge", count: 0)
    end
  end

  scenario 'Non-author tries to select best answer' do
    click_on 'Sign out'
    non_author = create(:user)
    login(non_author)
    visit question_path(question)
    
    within "#answer-#{answer1.id}" do
      expect(page).to_not have_link 'Mark as best'
    end
  end

  scenario 'Best answer is always first in the list' do
    # Create a best answer
    answer2.update(best: true)
    
    visit question_path(question)
    
    within '.answers' do
      expect(first('.answer')).to have_content answer2.body
      expect(page).to have_selector(".answer:first-child[data-answer-id='#{answer2.id}']")
    end
  end
end
