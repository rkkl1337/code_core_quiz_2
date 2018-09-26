# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Review.delete_all
Idea.delete_all
User.delete_all
PASSWORD = 'drowssap'

super_user = User.create(
  first_name: 'Lebron',
  last_name: 'James',
  email: 'lebronjames@nba.com',
  password: PASSWORD
)

10.times do
  first_name = Faker::Color.color_name.capitalize
  last_name = Faker::Pokemon.name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD
  )
end

users = User.all

25.times do
  title = "#{Faker::Hacker.ingverb.capitalize} #{Faker::WorldOfWarcraft.hero}"
  body = Faker::Lorem.paragraph(10)

  i = Idea.create(
    title: title,
    body: body,
    user: users.sample
  )

  next unless i.valid?

  5.times do
    title = "#{Faker::Hacker.ingverb.capitalize} #{Faker::Movie.quote}"
    review = Faker::Lorem.sentences.join(' ')
    Review.create(
      title: title,
      body: review,
      idea: i,
      user: users.sample
    )
  end
end

puts("Created #{User.count} users.")
puts("Created #{Idea.count} ideas.")
puts("Created #{Review.count} reviews.")
