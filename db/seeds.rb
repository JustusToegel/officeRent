# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)

require 'faker'

Flat.destroy_all
User.destroy_all

andy = User.create(
  email: "andy@gmail.com",
  password: "123456"
)

justus = User.create(
  email: "justus@gmail.com",
  password: "123456"
)

20.times do
  Flat.new(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    price: [49, 99, 199, 249, 299, 329, 399, 449, 499, 529, 549].sample,
    user_id: andy.id
  ).save
end

5.times do
  Booking.new(
    user_id: justus.id,
    flat_id: Flat.all.sample.id,
    request_date: [*Date.today..Date.new(2027, 5, 23)].sample
  ).save
end
