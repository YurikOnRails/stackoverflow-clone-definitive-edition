require 'rails_helper'

RSpec.feature 'Create answer with Turbo Stream', type: :feature, js: true do
  let!(:user) { create(:user) }
  let!(:question) { create(:question) }
  let(:answer) { build(:answer) }

  before do
    login(user)
    visit question_path(question)
  end

  scenario 'User adds answer to question', driver: :selenium_chrome_headless do
    fill_in 'Your answer', with: answer.body
    click_on 'Post Your Answer'

    expect(page).to have_content answer.body
    within '.answers' do
      expect(page).to have_selector("turbo-stream[action='append'][target='answers']", visible: false)
    end
    expect(page).to_not have_selector('#answer-form #answer_body', text: answer.body)
  end

  scenario 'User tries to add invalid answer' do
    click_on 'Post Your Answer'
    
    expect(page).to have_content "Body can't be blank"
    expect(page).to have_selector('form#new_answer')
  end
end
