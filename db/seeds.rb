# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
users = User.all

50.times do
  registered_application = RegisteredApplication.create!(
    user:     users.sample,
    name:     Faker::Name.title,
    url:      Faker::Internet.url
    )
end
registered_applications = RegisteredApplication.all

500.times do
  event = Event.create!(
    registered_application: registered_applications.sample,
    name:                   Faker::Name.title
    )
end
  events = Event.all

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
  email: 'user@example.com',
  password: 'helloworld'
  )

registered_application = RegisteredApplication.first
registered_application.update_attributes!(
  user: User.first,
  name: 'User Test',
  url: 'http://www.test.com'
  )

event = Event.first
event.update_attributes!(
  registered_application: RegisteredApplication.first,
  name:                   Faker::Name.title
  )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"