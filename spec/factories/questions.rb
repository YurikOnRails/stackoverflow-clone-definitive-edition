# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    association :user

    sequence(:title) { |n| "Test Question Title #{n}" }
    sequence(:body)  { |n| "This is a test question body, number #{n}, which is long enough to pass validation." }

    trait :invalid do
      title { nil }
    end
  end
end
