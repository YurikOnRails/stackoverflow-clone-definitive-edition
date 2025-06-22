# frozen_string_literal: true

class AddUserToAnswers < ActiveRecord::Migration[8.0]
  def change
    add_reference :answers, :user, null: false, foreign_key: true, default: 1
  end
end
