# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Clearing old data"

House.destroy_all
Offer.destroy_all
User.destroy_all
Favourite.destroy_all

puts "Creating new data"

i = 1
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Name.first_name + "@gmail.com",
    password: "password"
    )
  puts "Created user No. #{i}"
  i += 1
end

House.create!(
  user_id: User.first.id,
  address: "serangoon ave 1",
  price: 600000,
  bedroom: 2,
  bathroom: 2,
  square_feet: 700,
  description: "Cosy, homely, 10mins from the mrt",
  property_type: "HDB",
  tenure: "99-year"
)
puts "Created house 1"

House.create!(
  user_id: User.first.id,
  address: "bishan ave 1",
  price: 702100,
  bedroom: 4,
  bathroom: 1,
  square_feet: 921,
  description: "Cooling, lively, 31mins from the mrt",
  property_type: "Condo",
  tenure: "999-year"
)
puts "Created house 2"

House.create!(
  user_id: User.second.id,
  address: "ang mo kio ave 1",
  price: 800000,
  bedroom: 3,
  bathroom: 3,
  square_feet: 850,
  description: "South facing, high storey",
  property_type: "Condo",
  tenure: "99-year"
)
puts "Created house 3"

House.create!(
  user_id: User.third.id,
  address: "orchard rd",
  price: 4000000,
  bedroom: 5,
  bathroom: 5,
  square_feet: 1500,
  description: "Close to town, well-renovated",
  property_type: "Landed",
  tenure: "freehold"
)
puts "Created house 4"

House.create!(
  user_id: User.fourth.id,
  address: "raffles place",
  price: 900000,
  bedroom: 4,
  bathroom: 3,
  square_feet: 1100,
  description: "Near to tourist areas",
  property_type: "Condo",
  tenure: "999-year"
)
puts "Created house 5"

House.create!(
  user_id: User.fourth.id,
  address: "tanjong pagar",
  price: 650000,
  bedroom: 2,
  bathroom: 2,
  square_feet: 700,
  description: "Close to CBD",
  property_type: "HDB",
  tenure: "99-year"
)
puts "Created house 6"

# House.create!(
#   user_id: User.order(:id).offset(5).limit(1).first,
#   address: "tiong bahru",
#   price: 950000,
#   bedroom: 3,
#   bathroom: 3,
#   square_feet: 920,
#   description: "Cooling, lively, 31mins from the mrt",
#   property_type: "Condo",
#   tenure: "999-year"
# )
# puts "Created house 7"

# House.create!(
#   user_id: User.order(:id).offset(6).limit(1).first,
#   address: "pasir ris",
#   price: 480000,
#   bedroom: 2,
#   bathroom: 1,
#   square_feet: 600,
#   description: "Quiet, near to good schools",
#   property_type: "HDB",
#   tenure: "99-year"
# )
# puts "Created house 8"

# House.create!(
#   user_id: User.eighth.id,
#   address: "bishan ave 4",
#   price: 2500000,
#   bedroom: 4,
#   bathroom: 1,
#   square_feet: 921,
#   description: "15 mins from the mrt",
#   property_type: "Landed",
#   tenure: "999-year"
# )
# puts "Created house 9"

# House.create!(
#   user_id: User.nineth.id,
#   address: "cck",
#   price: 3000000,
#   bedroom: 5,
#   bathroom: 5,
#   square_feet: 1250,
#   description: "Away from the hustle and bustle",
#   property_type: "Landed",
#   tenure: "freehold"
# )
# puts "Created house 10"

j = 1
10.times do
  Offer.create!(
  user_id: User.all.sample.id,
  house_id: House.all.sample.id,
  price: rand(700000..5000000),
  status: ["pending", "accepted", "declined"].sample
  )
  puts "Created offer #{j}"
  j += 1
end

Favourite.create!(
  user_id: User.last.id,
  house_id: House.last.id
)

puts "Data completed"
