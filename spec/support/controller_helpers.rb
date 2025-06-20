# frozen_string_literal: true

# spec/support/controller_helpers.rb

module ControllerHelpers
  def login(user)
    sign_in(user, scope: :user)
  end
end
