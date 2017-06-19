# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "seeding..."

Artwork.destroy_all
User.destroy_all

quentin = User.new(
  username: "quentin",
  email: "quentin@quentin.com",
  password: "password",
  phone_number: "06 16 28 83 97"
  )
quentin.save!

kilian = User.new(
  username: "kilian",
  email: "kilian@kilian.com",
  password: "password",
  phone_number: "06 19 20 13 37"
  )
kilian.save!

cedric = User.new(
  username: "cedric",
  email: "cedric@cedric.com",
  password: "password",
  phone_number: "06 10 22 93 90"
  )
cedric.save!

joe = User.new(
  username: "joe",
  email: "joe@joe.com",
  password: "password",
  phone_number: "06 06 20 81 37"
  )
joe.save!


mona_lisa = Artwork.new(
  title: 'Mona Lisa',
  category: 'Painting',
  height: 100,
  width: 300,
  depth: 20,
  weight: 5,
  location: "Madrid",
  owner: quentin
  )
mona_lisa.save!

king_kong = Artwork.new(
  title: 'King Kong',
  category: 'Painting',
  height: 100,
  width: 200,
  depth: 5,
  weight: 9,
  location: "Sevilla",
  owner: joe
  )
king_kong.save!

barcelona = Artwork.new(
  title: 'Cityscapper',
  category: 'Photography',
  height: 100,
  width: 100,
  depth: 9,
  weight: 2,
  location: "Barcelona",
  owner: cedric
  )
barcelona.save!

fruits = Artwork.new(
  title: 'Cesar',
  category: 'Sculpture',
  height: 100,
  width: 360,
  depth: 2,
  weight: 3,
  location: "Bilbao",
  owner: kilian
  )
fruits.save!


###### FAKER ARTWORK ######

# category = [ "Painting", "Sculpture", "Photography", "Drawing", "Miscellaneous" ]
# city = [ "Barcelona", "Madrid", "Sevilla", "Bilbao", "Toledo" ]
# owner = [ cedric, kilian, joe, quentin ]

# 10.times do
#   artwork = Artwork.new(
#     title: Faker::RockBand.name,
#     category: category.sample,
#     height: rand(200..1000),
#     width: rand(200..1000),
#     depth: rand(1..50),
#     weight: rand(1..10),
#     location: city.sample,
#     owner: owner.sample
#     )
#   artwork.save!
#   # p artwork
# end


###### END FAKER ######



###### FAKER VENUES (not working --> employee) ######

# category = [ "Restaurant", "Co-workiung", "Hotels", "Companies", "School" ]
# city = [ "Barcelona", "Madrid", "Sevilla", "Bilbao", "Toledo" ]
# admin = [ cedric, kilian, joe, quentin ]

# 10.times do
#   venue = Venue.new(
#     title: Faker::Company.name,
#     category: category.sample,
#     location: city.sample,
#     employee: admin.sample
#     )
#   venue.save!
#   p venue
# end


###### END FAKER ######


