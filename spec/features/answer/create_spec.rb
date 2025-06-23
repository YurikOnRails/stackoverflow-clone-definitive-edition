# frozen_string_literal: true

require 'rails_helper'

feature 'User can create answer on question page', %q(
  In order to help with solving a problem
  As an authenticated user
  I'd like to be able to answer a question directly on its page
) do
  given(:user) { create(:user) }
  given!(:question) { create(:question) }

  scenario 'Authenticated user creates an answer', :js do
    sign_in(user)
    visit question_path(question)
    fill_in 'Body', with: 'My helpful answer'
    click_on 'Post answer'

    expect(page).to have_content 'My helpful answer'
  end

  scenario 'Authenticated user creates answer with Turbo Stream' do
    sign_in(user)
    visit question_path(question)
    
    fill_in 'Body', with: 'Test answer with Turbo Stream'
    click_on 'Post answer'

    expect(page).to have_content 'Test answer with Turbo Stream'
    expect(page).to have_current_path(question_path(question))
  end

  scenario 'Authenticated user submits empty answer', :js do
    sign_in(user)
    visit question_path(question)
    click_on 'Post answer'

    expect(page).to have_content "Body can't be blank"
  end

  scenario 'Unauthenticated user tries to answer' do
    visit question_path(question)
    expect(page).not_to have_selector("form#new_answer")
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
