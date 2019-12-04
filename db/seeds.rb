# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Bike.destroy_all
Bike.create(
{ name: "Mountain Bike Tibidabo",
  description: "I bought it less than a year ago and it works perfectly but I don't use it much",
  address: "Balmes 14, Barcelona",
  price: 14,
  user_id: 2,
  category: "Mountainbike",
  remote_photo_url: "https://res.cloudinary.com/dne2isn9y/image/upload/v1575467196/daveq3yujajcge9revkd.jpg"
},
{ name: "Electric bike",
  description: "I bought it less than a year ago and it works perfectly but I don't use it much"
  address: "Balmes 14, Barcelona",
  price: 14,
  category: "Mountainbike",
  photo: "daveq3yujajcge9revkd"
}])
