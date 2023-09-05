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
# Import seed house images (first 6 only)
file = URI.open("https://auctionjiacontent.s3.amazonaws.com/osproperty/properties/193/medium/1931598585858401-Serangoon-Ave-1-Living-Room.jpg")
house_1.photos.attach(io: file, filename: "house1.png", content_type: "image/png")
house_1.save
puts "Created house 1"

Offer.create!(
  user_id: user_doug.id,
  house_id: house_1.id,
  price: 700000,
  status: "pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_1.id,
  price: 720000,
  status: "pending"
)

Offer.create!(
  user_id: user_yc.id,
  house_id: house_1.id,
  price: 750000,
  status: "pending"
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
# Import seed house images (first 6 only)
file = URI.open("https://s3-ap-southeast-1.amazonaws.com/static.streetsine/Listing%20Photos/Circle/97462521/L/374066951_mobile.jpg?20220908222907")
house_2.photos.attach(io: file, filename: "house2.png", content_type: "image/png")
house_2.save
puts "Created house 2"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_2.id,
  price: 750000,
  status: "pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_2.id,
  price: 800000,
  status: "pending"
)

Offer.create!(
  user_id: user_doug.id,
  house_id: house_2.id,
  price: 730000,
  status: "pending"
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
# Import seed house images (first 6 only)
file = URI.open("https://alanweeproperty.com/wp-content/uploads/2022/08/301-Ang-Mo-Kio-Ave-3-Jumbo-Flat-Living-Room.jpg")
house_3.photos.attach(io: file, filename: "house3.png", content_type: "image/png")
house_3.save
puts "Created house 3"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_3.id,
  price: 854100,
  status: "pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_3.id,
  price: 900000,
  status: "pending"
)

Offer.create!(
  user_id: user_yc.id,
  house_id: house_3.id,
  price: 910000,
  status: "pending"
)

Offer.create!(
  user_id: user_doug.id,
  house_id: house_3.id,
  price: 1000000,
  status: "pending"
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
file = URI.open("https://sg1-cdn.pgimgs.com/listing/24493503/UPHO.143170962.V550/Cairnhill-Residences-Orchard-River-Valley-Singapore.jpg")
house_4.photos.attach(io: file, filename: "house4.png", content_type: "image/png")
house_4.save
puts "Created house 4"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_4.id,
  price: 4000010,
  status: "pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_4.id,
  price: 4050000,
  status: "pending"
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
# Import seed house images (first 6 only)
file = URI.open("https://www.discoverasr.com/content/dam/tal/media/images/properties/singapore/singapore/citadines-raffles-place-singapore/overview/citadines-raffles-place-singapore-living-rm-750x600.jpg.transform/ascott-lowres/image.jpg")
house_5.photos.attach(io: file, filename: "house5.png", content_type: "image/png")
house_5.save
puts "Created house 5"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_5.id,
  price: 10000010,
  status: "pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_5.id,
  price: 11000000,
  status: "pending"
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
# Import seed house images
file = URI.open("https://www.retalkasia.com/sites/default/files/styles/article-full/public/imagereader_5_24.jpg?itok=6Af7E8CN")
house_6.photos.attach(io: file, filename: "house6.png", content_type: "image/png")
house_6.save
puts "Created house 6"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_6.id,
  price: 10000010,
  status: "pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_6.id,
  price: 11000000,
  status: "pending"
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
# Import seed house images
file = URI.open("https://d1hy6t2xeg0mdl.cloudfront.net/image/1834/9741cd6fa8/standard-nofill")
house_7.photos.attach(io: file, filename: "house7.png", content_type: "image/png")
house_7.save
puts "Created house 7"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_7.id,
  price: 1000010,
  status: "pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_7.id,
  price: 1100000,
  status: "pending"
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
# Import seed house images
file = URI.open("https://sg1-cdn.pgimgs.com/listing/24520581/UPHO.141959898.V550/643-Yishun-Street-61-Sembawang-Yishun-Singapore.jpg")
house_8.photos.attach(io: file, filename: "house8.png", content_type: "image/png")
house_8.save
puts "Created house 8"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_8.id,
  price: 500000,
  status: "pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_8.id,
  price: 600000,
  status: "pending"
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
# Import seed house images
file = URI.open("https://sg1-cdn.pgimgs.com/listing/23779849/UPHO.134849182.V550/135-Bishan-Street-12-Ang-Mo-Kio-Bishan-Thomson-Singapore.jpg")
house_9.photos.attach(io: file, filename: "house8.png", content_type: "image/png")
house_9.save
puts "Created house 9"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_9.id,
  price: 10000010,
  status: "pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_9.id,
  price: 11000000,
  status: "pending"
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
file = URI.open("https://sg1-cdn.pgimgs.com/listing/24534214/UPHO.142117643.V550/694D-Woodlands-Drive-62-Admiralty-Woodlands-Singapore.jpg")
house_10.photos.attach(io: file, filename: "house8.png", content_type: "image/png")
house_10.save
puts "Created house 10"

Offer.create!(
  user_id: user_bob.id,
  house_id: house_10.id,
  price: 1000010,
  status: "pending"
)

Offer.create!(
  user_id: user_alex.id,
  house_id: house_10.id,
  price: 1100000,
  status: "pending"
)

# j = 1
# 10.times do
#   Offer.create!(
#     user_id: User.all.sample.id,
#     house_id: House.all.sample.id,
#     price: 10000000,
#     status: "pending"
#   )
#   puts "Created offer #{j}"
#   j += 1
# end

Favourite.create!(
  user_id: User.last.id,
  house_id: House.last.id
)

puts "Data completed"
