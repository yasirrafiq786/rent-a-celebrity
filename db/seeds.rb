# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "done"
puts "destroying messages"
Message.destroy_all 
puts "destroying chatrooms"
Chatroom.destroy_all
Booking.destroy_all 
puts "destroying celebrities"
Celebrity.destroy_all 
puts "done"
puts "destroying usernames"
User.destroy_all
puts "done"
puts "Destroying Reviews"
Review.destroy_all
puts "Done"
puts "making a chatroom called master"
master = Chatroom.create(name: "master")
puts "chatroom master done"
puts "Creating Host and Guest User"
User.create!(first_name:"Host", last_name:"Hospitulus", email:"host@host.com", password:"abc123")
User.create!(first_name:"Guest", last_name:"Demandus", email:"guest@guest.com", password:"abc123")

