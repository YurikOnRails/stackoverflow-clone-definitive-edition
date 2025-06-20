# frozen_string_literal: true

require 'rails_helper'

feature 'User can sign up', %q(
  In order to ask and answer questions
  As a new user
  I'd like to be able to register
) do
  background { visit new_user_registration_path }

  scenario 'User signs up with valid data' do
    fill_in 'Email', with: 'newuser@example.com'
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'User signs up with invalid data' do
    click_on 'Sign up'

    expect(page).to have_content "Email can't be blank"
  end
end
