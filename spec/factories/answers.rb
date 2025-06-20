# frozen_string_literal: true

FactoryBot.define do
  factory :answer do
    association :user
    association :question

    sequence(:body) { |n| "This is a test answer body, number #{n}, which is long enough." }

    trait :invalid do
      body { nil }
    end
  end
end
