# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

puts "Base de donnée vide"
puts "-------------------------------------------------------"
puts " "

puts "-------------------------------------------------------"
puts "Here are all the users created"
puts "-------------------------------------------------------"
puts " "

20.times do 
  user = User.create!(
  	email: Faker::Internet.email,
  	password: "azertyuiop",
  	description: Faker::Movies::HarryPotter.quote,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name)
  puts "#{user.first_name}"
end

puts "-------------------------------------------------------"
puts "Here are all the events created"
puts "-------------------------------------------------------"
puts " "
50.times do 
start_d = Date.new(rand(2019..2030), rand(5..12), rand(7..28))
  event = Event.create!(
  	start_date: start_d,
  	duration: rand(1..100)*5,
  	title: Faker::Book.title,
  	description: Faker::Lorem.paragraph_by_chars(150, false),
  	price: rand(1..1000),
  	location: Faker::Movies::HarryPotter.location,
  	admin: User.all.sample)
  	
  puts "#{event.title} in #{event.location}"
end

#puts "Here are all the bookings created"
puts "-------------------------------------------------------"
puts "Attendance "
puts "-------------------------------------------------------"
puts " "
100.times do
  att = Attendance.create!(
  	stripe_customer_id: "smthg",
  	participant: User.all.sample,
    created_event: Event.all.sample)
  
end