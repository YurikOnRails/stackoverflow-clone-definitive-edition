require 'rails_helper'

RSpec.feature 'Answers', type: :feature do
  let!(:user) { create(:user) }
  let!(:question) { create(:question) }

  scenario 'Authenticated user creates answer with errors' do
    sign_in(user)
    visit question_path(question)


    click_on 'Create'

    expect(page).to have_content "Body can't be blank"
  end

  scenario 'Authenticated user creates answer with Turbo Stream' do
    sign_in(user)
    visit question_path(question)

    
    fill_in 'Your answer', with: 'Test answer'
    click_on 'Create'

    expect(page).to have_content 'Test answer'
    expect(page).to have_current_path(question_path(question))
  end
end
