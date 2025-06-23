# frozen_string_literal: true

Rails.logger.debug 'Cleaning database...'
Answer.destroy_all
Question.destroy_all
User.destroy_all

Rails.logger.debug 'Creating users...'

andrey = User.create!(
  email: 'andrey@example.com',
  password: 'password',
  password_confirmation: 'password'
)

random_users = Array.new(4) do
  User.create!(
    email: FFaker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

users = [ andrey ] + random_users
Rails.logger.debug 'Users created.'

Rails.logger.debug 'Creating questions...'
questions = users.flat_map do |user|
  Array.new(2) do
    user.questions.create!(
            title: FFaker::Lorem.sentence(5).delete_suffix('.'),
      body: FFaker::Lorem.paragraph
    )
  end
end
Rails.logger.debug 'Questions created.'

Rails.logger.debug 'Creating answers...'
questions.each do |question|
  3.times do
    question.answers.create!(
      body: FFaker::Lorem.paragraph,
      user: users.sample
    )
  end
end
Rails.logger.debug 'Answers created.'

Rails.logger.debug 'Finished seeding!'
