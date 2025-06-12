FactoryBot.define do
  factory :question do
    title { "Важный вопрос о Ruby on Rails" }
    body { "Это тело вопроса, которое должно быть не менее 10 символов для прохождения валидации" }
  end
end
