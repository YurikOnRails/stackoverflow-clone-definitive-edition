# frozen_string_literal: true

puts 'Cleaning database...'
Answer.destroy_all
Question.destroy_all
User.destroy_all

puts 'Creating users...'

andrey = User.create!(
  email: 'andrey@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)

random_users = 4.times.map do
  User.create!(
    email: FFaker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

users = [andrey] + random_users
puts 'Users created.'

puts 'Creating questions...'
questions = users.flat_map do |user|
  2.times.map do
    user.questions.create!(
            title: FFaker::Lorem.sentence(5).delete_suffix('.'),
      body: FFaker::Lorem.paragraph
    )
  end
end
puts 'Questions created.'

puts 'Creating answers...'
questions.each do |question|
  3.times do
    question.answers.create!(
      body: FFaker::Lorem.paragraph,
      user: users.sample
    )
  end
end
puts 'Answers created.'

puts 'Finished seeding!'
