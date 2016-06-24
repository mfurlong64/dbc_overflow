require 'faker'

20.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password_hash: "123"
    )
end

10.times do
  Question.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    user_id: rand(1..20)
    )
end

10.times do
  Answer.create(
    body: Faker::Lorem.paragraph,
    user_id: rand(1..20),
    question_id: rand(1..10)
    )
end

100.times do
  Vote.create(
    user_id: rand(1..20),
    voteable_id: rand(1..10),
    voteable_type: ["Answer", "Question"].sample
    )
end
