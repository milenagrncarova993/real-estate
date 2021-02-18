# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"



puts 'Cleaning database now...'
Booking.destroy_all
Property.destroy_all
User.destroy_all
puts 'Database clean ✅'

# Users:

owner_array = []

user_owner = User.new
user_owner.email = 'anne.owner@gmail.com' # user_owner1 to offer trucks
user_owner.password = '123456'
user_owner.save!


property_array = []


p = Property.new
p.address = "Wedekind Strasse 23"
p.size = "50m2"
p.year = 1990
p.rooms = 2
p.price = 1000
p.type_of_property = "House"
p.state = "Simple"
p.user = user_owner
p.save 

property_array << p


booking_array = []

b = Booking.new
b.start_date = DateTime.new(2020, 11, 18)
b.end_date = DateTime.new(2020, 11, 20)
b.status = "Free"
b.user = user_owner
b.property = p
b.save

booking_array << b 

puts "Done!"
puts "Created #{User.count} users."
puts "Created #{Property.count} properties."
puts "Created #{Booking.count} bookings."