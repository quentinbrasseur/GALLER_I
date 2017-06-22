# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "seeding..."

UserVenue.destroy_all
Artwork.destroy_all
Venue.destroy_all
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

p quentin.id
p joe.id
p kilian.id
p cedric.id


###### FAKER ARTWORK ######

category = [ "Painting", "Sculpture", "Photography", "Drawing", "Miscellaneous" ]
city = [ "Barcelona", "Madrid", "Sevilla", "Bilbao", "Toledo" ]
owner = [ cedric, kilian, joe, quentin ]
type = [ "Cafe", "Restaurant", "Bar", "Co-Working", "Office" ]


20.times do
  artwork = Artwork.create(
    title: Faker::Lorem.word,
    category: category.sample,
    height: rand(200..1000),
    width: rand(200..1000),
    depth: rand(1..50),
    weight: rand(1..10),
    location: city.sample,
    photo_url: "https://lorempixel.com/300/200/",
    owner: owner.sample
    )

end

###### END FAKER ######


##### venues ######

mcdo = Venue.create(
 title: Faker::Company.name,
 category: type.sample,
 location: city.sample,
 photo_url: "http://lorempixel.com/300/200/logo/",
 )

kfc = Venue.create(
 title: Faker::Company.name,
 category: type.sample,
 location: city.sample,
 photo_url: "http://lorempixel.com/300/200/business/",
  )

pizzahut = Venue.create(
 title: Faker::Company.name,
 category: type.sample,
 location: city.sample,
 photo_url: "http://lorempixel.com/300/200/business/",
  )

chipotle = Venue.create(
 title: Faker::Company.name,
 category: type.sample,
 location: city.sample,
 photo_url: "http://lorempixel.com/300/200/business/",
  )

p mcdo
p kfc
p pizzahut
p chipotle

###### end venues #####



##### user_venues ######

a1 = UserVenue.create(
  user_id: quentin.id,
  venue_id: mcdo.id
  )

a2 = UserVenue.create(
  user_id: joe.id,
  venue_id: kfc.id
  )

a3 = UserVenue.create(
  user_id: kilian.id,
  venue_id: pizzahut.id
  )

a4 = UserVenue.create(
  user_id: cedric.id,
  venue_id: pizzahut.id
  )

p a1
p a2
p a3
p a4


###### end user-venues #####


###### FAKER VENUES (not working --> employee) ######

# category = [ "Restaurant", "Co-workiung", "Hotels", "Companies", "School" ]
# city = [ "Barcelona", "Madrid", "Sevilla", "Bilbao", "Toledo" ]
# admin = [ cedric, kilian, joe, quentin ]

# 5.times do
#   venue = Venue.create(
#     title: Faker::Company.name,
#     category: category.sample,
#     location: city.sample,
#     photo_url: "http://lorempixel.com/300/200/business/",
#     # employee: admin.sample
#     )
#   p venue
# end

###### END FAKER ######


