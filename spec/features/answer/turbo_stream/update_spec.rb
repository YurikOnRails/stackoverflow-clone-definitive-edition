require 'rails_helper'

RSpec.feature 'Update answer with Turbo Stream', type: :feature, js: true do
  let!(:user) { create(:user) }
  let!(:question) { create(:question) }
  let!(:answer) { create(:answer, question: question, user: user) }
  let(:updated_body) { 'Updated answer body' }

  before do
    login(user)
    visit question_path(question)
  end

  scenario 'Author edits their answer' do
    within "#answer-#{answer.id}" do
      click_on 'Edit'
      fill_in 'Your answer', with: updated_body
      click_on 'Save'
    end

    expect(page).to have_content updated_body
    expect(page).to_not have_selector("#answer-#{answer.id} form")
  end

  scenario 'Author tries to save invalid answer' do
    within "#answer-#{answer.id}" do
      click_on 'Edit'
      fill_in 'Your answer', with: ''
      click_on 'Save'
    end

    expect(page).to have_content "Body can't be blank"
    expect(page).to have_selector("#answer-#{answer.id} form")
  end

  scenario "Non-author can't see edit link" do
    click_on 'Sign out'
    login(create(:user))
    visit question_path(question)
    
    within "#answer-#{answer.id}" do
      expect(page).to_not have_link 'Edit'
    end
  end
end
