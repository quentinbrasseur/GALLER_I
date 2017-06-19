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
  name: "quentin",
  email: "quentin@quentin.com",
  password: "password",
  phone_number: "06 16 28 83 97")
quentin.save!
kilian = User.new(
  name: "kilian",
  email: "kilian@kilian.com",
  password: "password",
  phone_number: "06 19 20 13 37")
kilian.save!
cedric = User.new(
  name: "cedric",
  email: "cedric@cedric.com",
  password: "password",
  phone_number: "06 10 22 93 90")
cedric.save!
joe = User.new(
  name: "joe",
  email: "joe@joe.com",
  password: "password",
  phone_number: "06 06 20 81 37")
joe.save!
mona_lisa = Artwork.new(
  title: 'Mona Lisa',
  category: 'Old school',
  size: "50x50",
  location: "Gracia",
  user_id: quentin.id)
king_kong = Artwork.new(
  title: 'King Kong',
  category: 'Pop Art',
  size: "100x50",
  location: "Sagrada",
  user_id: cedric.id)
barcelona = Artwork.new(
  title: 'Barcelona',
  category: 'Landscape',
  size: "200x200",
  location: "Poblenou",
  user_id: kilian.id
  )
fruits = Artwork.new(
  title: 'Fruits',
  category: 'Nature morte',
  size: "20x20",
  location: "Raval",
  user_id: joe.id
  )
mona_lisa.save!
barcelona.save!
fruits.save!
king_kong.save!
p fruits
