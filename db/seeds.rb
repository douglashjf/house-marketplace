# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require "open-uri"

puts "Clearing old data"

House.destroy_all
Offer.destroy_all
User.destroy_all
Favourite.destroy_all

puts "Creating new data"

# i = 1
# 10.times do
#   User.create!(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Name.first_name + "@gmail.com",
#     password: "password"
#     )
#   puts "Created user No. #{i}"
#   i += 1
# end

# Doug: Buyer
user_doug = User.create!(
  first_name: "Doug",
  last_name: "Hsu",
  email: "doug@gmail.com",
  password: "password"
)
puts "Created Douglas Buyer"

# Jacob: Seller
user_jacob = User.create!(
  first_name: "Jacob",
  last_name: "Khong",
  email: "jacob@gmail.com",
  password: "password"
)
puts "Created Jacob Seller"

user_bob = User.create(
  first_name: 'Bob',
  last_name: 'Bobberson',
  email: 'bob.bobberson@gmail.com',
  password: 'password'
)
puts 'Created Bob user'

user_anna = User.create(
  first_name: 'Anna',
  last_name: 'Annason',
  email: 'anna.annason@gmail.com',
  password: 'password'
)
puts 'Created Anna user'

user_yc = User.create(
  first_name: 'YC',
  last_name: 'Low',
  email: 'yc.low@gmail.com',
  password: 'password'
)
puts 'Created YC user'

user_alex = User.create(
  first_name: 'Alex',
  last_name: 'Alexson',
  email: 'alex.alexson@gmail.com',
  password: 'password'
)
puts 'Created Alex user'

house_1 = House.create!(
  user_id: user_jacob.id,
  address: "Serangoon Avenue 1",
  price: 600000,
  bedroom: 2,
  bathroom: 2,
  square_feet: 700,
  description: "Cosy, homely, 10mins from the mrt",
  property_type: "HDB",
  tenure: "99-year",
  region: "North East Community Development Council"
)
# Array of photo URLs
photo_urls = [
  "https://sg1-cdn.pgimgs.com/listing/24672217/UPHO.143661959.V800/Sol-Acres-Dairy-Farm-Bukit-Panjang-Choa-Chu-Kang-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24672217/UPHO.143722231.V800/Sol-Acres-Dairy-Farm-Bukit-Panjang-Choa-Chu-Kang-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24672217/UPHO.143722232.V800/Sol-Acres-Dairy-Farm-Bukit-Panjang-Choa-Chu-Kang-Singapore.jpg"
]

# Attach photos using a loop
photo_urls.each do |url|
  file = URI.open(url)
  house_1.photos.attach(io: file, filename: "house_#{house_1.id}_photo#{photo_urls.index(url) + 1}.jpg", content_type: "image/jpeg")
end

puts "Created house 1 with multiple photos"

Offer.create!(
  user_id: user_doug.id,
  house_id: house_1.id,
  price: 700000,
  status: "Pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_1.id,
  price: 720000,
  status: "Pending"
)

Offer.create!(
  user_id: user_yc.id,
  house_id: house_1.id,
  price: 750000,
  status: "Pending"
)

house_2 = House.create!(
  user_id: user_jacob.id,
  address: "Bishan Avenue 1",
  price: 702100,
  bedroom: 4,
  bathroom: 1,
  square_feet: 921,
  description: "Cooling, lively, 31mins from the mrt",
  property_type: "Condo",
  tenure: "999-year",
  region: "Central Singapore Community Development Council"
)

# Array of photo URLs
photo_urls = [
  "https://sg1-cdn.pgimgs.com/listing/24645902/UPHO.143355337.V800/658B-Punggol-East-Hougang-Punggol-Sengkang-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24645902/UPHO.143355354.V800/658B-Punggol-East-Hougang-Punggol-Sengkang-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24645902/UPHO.143355343.V800/658B-Punggol-East-Hougang-Punggol-Sengkang-Singapore.jpg"
]

# Attach photos using a loop
photo_urls.each do |url|
  file = URI.open(url)
  house_2.photos.attach(io: file, filename: "house_#{house_2.id}_photo#{photo_urls.index(url) + 1}.jpg", content_type: "image/jpeg")
end

puts "Created house 2 with multiple photos"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_2.id,
  price: 750000,
  status: "Pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_2.id,
  price: 800000,
  status: "Pending"
)

Offer.create!(
  user_id: user_doug.id,
  house_id: house_2.id,
  price: 730000,
  status: "Pending"
)

house_3 = House.create!(
  user_id: user_anna.id,
  address: "Ang Mo Kio Avenue 1",
  price: 800000,
  bedroom: 3,
  bathroom: 3,
  square_feet: 850,
  description: "South facing, high storey",
  property_type: "Condo",
  tenure: "99-year",
  region: "Central Singapore Community Development Council"
)
# Array of photo URLs
photo_urls = [
  "https://sg1-cdn.pgimgs.com/listing/24119000/UPHO.142770548.V800/Avenue-South-Residence-Alexandra-Commonwealth-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24119000/UPHO.142770557.V800/Avenue-South-Residence-Alexandra-Commonwealth-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24119000/UPHO.142770558.V800/Avenue-South-Residence-Alexandra-Commonwealth-Singapore.jpg"
]

# Attach photos using a loop
photo_urls.each do |url|
  file = URI.open(url)
  house_3.photos.attach(io: file, filename: "house_#{house_3.id}_photo#{photo_urls.index(url) + 1}.jpg", content_type: "image/jpeg")
end

puts "Created house 3 with multiple photos"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_3.id,
  price: 854100,
  status: "Pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_3.id,
  price: 900000,
  status: "Pending"
)

Offer.create!(
  user_id: user_yc.id,
  house_id: house_3.id,
  price: 910000,
  status: "Pending"
)

Offer.create!(
  user_id: user_doug.id,
  house_id: house_3.id,
  price: 1000000,
  status: "Pending"
)

house_4 = House.create!(
  user_id: user_anna.id,
  address: "Orchard Road, Singapore",
  price: 4000000,
  bedroom: 5,
  bathroom: 5,
  square_feet: 1500,
  description: "Close to town, well-renovated",
  property_type: "Landed",
  tenure: "freehold",
  region: "Central Singapore Community Development Council"
)
# Import seed house cover images (first 6 only)
photo_urls = [
  "https://sg1-cdn.pgimgs.com/listing/24638334/UPHO.143265760.V800/One-Draycott-Tanglin-Holland-Bukit-Timah-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24638334/UPHO.143265757.V800/One-Draycott-Tanglin-Holland-Bukit-Timah-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24638334/UPHO.143265759.V800/One-Draycott-Tanglin-Holland-Bukit-Timah-Singapore.jpg"
]

# Attach photos using a loop
photo_urls.each do |url|
  file = URI.open(url)
  house_4.photos.attach(io: file, filename: "house_#{house_4.id}_photo#{photo_urls.index(url) + 1}.jpg", content_type: "image/jpeg")
end

puts "Created house 4 with multiple photos"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_4.id,
  price: 4000010,
  status: "Pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_4.id,
  price: 4050000,
  status: "Pending"
)

house_5 = House.create!(
  user_id: user_anna.id,
  address: "Raffles Place",
  price: 5000000,
  bedroom: 4,
  bathroom: 3,
  square_feet: 1100,
  description: "Near to tourist areas",
  property_type: "Condo",
  tenure: "999-year",
  region: "Central Singapore Community Development Council"
)
photo_urls = [
  "https://sg1-cdn.pgimgs.com/listing/24616122/UPHO.143007868.V800/The-Tre-Ver-Macpherson-Potong-Pasir-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24616122/UPHO.143007869.V800/The-Tre-Ver-Macpherson-Potong-Pasir-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24616122/UPHO.143007872.V800/The-Tre-Ver-Macpherson-Potong-Pasir-Singapore.jpg"
]

# Attach photos using a loop
photo_urls.each do |url|
  file = URI.open(url)
  house_5.photos.attach(io: file, filename: "house_#{house_5.id}_photo#{photo_urls.index(url) + 1}.jpg", content_type: "image/jpeg")
end

puts "Created house 5 with multiple photos"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_5.id,
  price: 10000010,
  status: "Pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_5.id,
  price: 11000000,
  status: "Pending"
)

house_6 = House.create!(
  user_id: user_bob.id,
  address: "Tanjong Pagar",
  price: 6000000,
  bedroom: 2,
  bathroom: 2,
  square_feet: 700,
  description: "Close to CBD, very airy!",
  property_type: "HDB",
  tenure: "99-year",
  region: "Central Singapore Community Development Council"
)
photo_urls = [
  "https://sg1-cdn.pgimgs.com/listing/24647400/UPHO.143373730.V800/Coco-Palms-Pasir-Ris-Tampines-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24647400/UPHO.143373721.V800/Coco-Palms-Pasir-Ris-Tampines-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24647400/UPHO.143373719.V800/Coco-Palms-Pasir-Ris-Tampines-Singapore.jpg"
]

# Attach photos using a loop
photo_urls.each do |url|
  file = URI.open(url)
  house_6.photos.attach(io: file, filename: "house_#{house_6.id}_photo#{photo_urls.index(url) + 1}.jpg", content_type: "image/jpeg")
end

puts "Created house 6 with multiple photos"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_6.id,
  price: 10000010,
  status: "Pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_6.id,
  price: 11000000,
  status: "Pending"
)

house_7 = House.create!(
  user_id: user_bob.id,
  address: "Yishun Avenue 1",
  price: 950000,
  bedroom: 2,
  bathroom: 2,
  square_feet: 920,
  description: "Cooling, lively, 10mins from the mrt",
  property_type: "HDB",
  tenure: "999-year",
  region: "North East Community Development Council"
)
photo_urls = [
  "https://sg1-cdn.pgimgs.com/listing/24666981/UPHO.143599024.V800/Sims-Urban-Oasis-Eunos-Geylang-Paya-Lebar-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24666981/UPHO.143599014.V800/Sims-Urban-Oasis-Eunos-Geylang-Paya-Lebar-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24666981/UPHO.143599017.V800/Sims-Urban-Oasis-Eunos-Geylang-Paya-Lebar-Singapore.jpg"
]

# Attach photos using a loop
photo_urls.each do |url|
  file = URI.open(url)
  house_7.photos.attach(io: file, filename: "house_#{house_7.id}_photo#{photo_urls.index(url) + 1}.jpg", content_type: "image/jpeg")
end

puts "Created house 7 with multiple photos"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_7.id,
  price: 1000010,
  status: "Pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_7.id,
  price: 1100000,
  status: "Pending"
)

house_8 = House.create!(
  user_id: user_bob.id,
  address: "Tampines",
  price: 480000,
  bedroom: 2,
  bathroom: 1,
  square_feet: 600,
  description: "Quiet, near to good schools",
  property_type: "HDB",
  tenure: "99-year",
  region: "North East Community Development Council"
)
photo_urls = [
  "https://sg1-cdn.pgimgs.com/listing/24545621/UPHO.142247804.V800/Penrose-Eunos-Geylang-Paya-Lebar-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24545621/UPHO.142247810.V800/Penrose-Eunos-Geylang-Paya-Lebar-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24545621/UPHO.142247811.V800/Penrose-Eunos-Geylang-Paya-Lebar-Singapore.jpg"
]

# Attach photos using a loop
photo_urls.each do |url|
  file = URI.open(url)
  house_8.photos.attach(io: file, filename: "house_#{house_8.id}_photo#{photo_urls.index(url) + 1}.jpg", content_type: "image/jpeg")
end

puts "Created house 8 with multiple photos"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_8.id,
  price: 500000,
  status: "Pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_8.id,
  price: 600000,
  status: "Pending"
)

house_9 = House.create!(
  user_id: user_bob.id,
  address: "Bukit Timah",
  price: 2500000,
  bedroom: 4,
  bathroom: 1,
  square_feet: 921,
  description: "15 mins from the mrt",
  property_type: "Landed",
  tenure: "999-year",
  region: "Central Singapore Community Development Council"
)
photo_urls = [
  "https://sg1-cdn.pgimgs.com/listing/24641495/UPHO.143302170.V800/Watten-House-Newton-Novena-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24641495/UPHO.143302167.V800/Watten-House-Newton-Novena-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24641495/UPHO.143302168.V800/Watten-House-Newton-Novena-Singapore.jpg"
]

# Attach photos using a loop
photo_urls.each do |url|
  file = URI.open(url)
  house_9.photos.attach(io: file, filename: "house_#{house_9.id}_photo#{photo_urls.index(url) + 1}.jpg", content_type: "image/jpeg")
end

puts "Created house 9 with multiple photos"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_9.id,
  price: 10000010,
  status: "Pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_9.id,
  price: 11000000,
  status: "Pending"
)

house_10 = House.create!(
  user_id: user_bob.id,
  address: "Boon Lay",
  price: 300000,
  bedroom: 5,
  bathroom: 5,
  square_feet: 1250,
  description: "Away from the hustle and bustle",
  property_type: "Landed",
  tenure: "freehold",
  region: "South West Community Development Council"
)
photo_urls = [
  "https://sg1-cdn.pgimgs.com/listing/24660803/UPHO.143531173.V800/Parc-Komo-Changi-Airport-Changi-Village-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24660803/UPHO.143531178.V800/Parc-Komo-Changi-Airport-Changi-Village-Singapore.jpg",
  "https://sg1-cdn.pgimgs.com/listing/24660803/UPHO.143531179.V800/Parc-Komo-Changi-Airport-Changi-Village-Singapore.jpg"
]

# Attach photos using a loop
photo_urls.each do |url|
  file = URI.open(url)
  house_10.photos.attach(io: file, filename: "house_#{house_10.id}_photo#{photo_urls.index(url) + 1}.jpg", content_type: "image/jpeg")
end

puts "Created house 10 with multiple photos"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_10.id,
  price: 1000010,
  status: "Pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_10.id,
  price: 1100000,
  status: "Pending"
)

# j = 1
# 10.times do
#   Offer.create!(
#     user_id: User.all.sample.id,
#     house_id: House.all.sample.id,
#     price: 10000000,
#     status: "Pending"
#   )
#   puts "Created offer #{j}"
#   j += 1
# end

Favourite.create!(
  user_id: User.last.id,
  house_id: House.last.id
)

puts "Data completed"
