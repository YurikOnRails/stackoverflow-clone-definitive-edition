FactoryBot.define do
  factory :answer do
    body { 'Ответ на вопрос, не менее 10 символов.' }
    association :question
  end
end 
