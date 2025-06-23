require 'rails_helper'

RSpec.feature 'Delete answer with Turbo Stream', type: :feature, js: true do
  let!(:user) { create(:user) }
  let!(:question) { create(:question) }
  let!(:answer) { create(:answer, question: question, user: user) }

  before do
    login(user)
    visit question_path(question)
  end

  scenario 'Author deletes their answer' do
    within "#answer-#{answer.id}" do
      accept_confirm { click_on 'Delete' }
    end

    expect(page).to have_selector('turbo-stream[action="remove"]', visible: false)
    expect(page).to_not have_content answer.body
  end

  scenario "Non-author can't see delete link" do
    click_on 'Sign out'
    login(create(:user))
    visit question_path(question)
    
    within "#answer-#{answer.id}" do
      expect(page).to_not have_link 'Delete'
    end
  end
end
