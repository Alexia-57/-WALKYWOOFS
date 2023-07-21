require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Dogwalk.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

# Sample data for users
users_data = [
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "John", email: "john@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Jane", email: "jane@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Sarah", email: "sarah@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Yann", email: "yann@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Chris", email: "chris@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Saki", email: "saki@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Alexia", email: "alexia@example.com", password: "password" },
  { pickup_spot: "dummy details", pet_details: "dummy details", nickname: "Zhan", email: "zhan@example.com", password: "password" },
]

users_data.each do |user_info|
  User.create!(user_info)
end

dogwalks_data = [
  {user_name: "Zhan", name: "eg1", image_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/monstera.jpg", user_name: "John" },
  {user_name: "John", name: "eg2", image_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/monstera.jpg", user_name: "Jane" },
  {user_name: "Sarah", name: "eg3", image_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/monstera.jpg", user_name: "Sarah" },
  {user_name: "Yann", name: "eg4", image_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/monstera.jpg", user_name: "Yann" },
  {user_name: "Chris", name: "eg5", image_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/monstera.jpg", user_name: "Chris" },
  {user_name: "Saki", name: "eg6", image_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/monstera.jpg", user_name: "Saki" },
  {user_name: "Alexia", name: "eg7", image_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/monstera.jpg", user_name: "Alexia" },
  {user_name: "Jane", name: "eg8", image_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/monstera.jpg", user_name: "Zhan" },
]

dogwalks_data.each do |dogwalk_info|
  user = User.find_by(nickname: dogwalk_info[:user_name])
  Dogwalk.create!(
    # image_url: dogwalk_info[:image_url],
    service_details: Faker::Lorem.words(number: 4),
    dog_capacity: 1,
    neighborhood: Faker::Lorem.words(number: 2),
    duration: 1.5,
    hourly_rate: 100,
    user: user
  )
end
