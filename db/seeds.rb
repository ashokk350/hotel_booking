# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

5.times do
  hotel = Hotel.create!(
    name: Faker::Company.name,
    location: Faker::Address.city
  )

  10.times do
    hotel.rooms.create!(
      room_number: Faker::Number.unique.number(digits: 3), # unique room numbers
      room_type: Faker::Lorem.word,
      price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
    )
  end
end