# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create a main sample user.
# Create a main sample user.
User.create!(name: "Neha Gupta",
email: "nehag@miniposts.com",
password: "password",
password_confirmation: "password",
admin: true,
activated: true,
activated_at: Time.zone.now)
# Generate a bunch of additional users.
40.times do |n|
name = Faker::Name.name
email = "neha-#{n+1}@miniposts.com"
password = "password"
User.create!(name: name,
email: email,
password: password,
password_confirmation: password,
activated: true,
activated_at: Time.zone.now)
end
