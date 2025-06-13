# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    sequence(:title) { |n| "Важный вопрос о Ruby on Rails #{n}" }
    sequence(:body)  { |n| "Это тело вопроса №#{n}, которое должно быть не менее 10 символов для прохождения валидации" }

    trait :invalid do
      title { nil }
    end
  end
end
