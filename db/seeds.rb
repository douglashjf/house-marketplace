# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Clearing old data"

House.destroy_all

puts "Creating new data"

houses = House.create!([{
  user_id: 1,
  address: "serangoon ave 1",
  price: 600000,
  bedroom: 2,
  bathroom: 2,
  square_feet: 700,
  description: "Cosy, homely, 10mins from the mrt",
  property_type: "3-room flat",
  tenure: "99-years"
}])
puts "Data completed"
