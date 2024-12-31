# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


user1 = User.create(email: "user1@email.com", password: "test123", password_confirmation: "test123")
user2 = User.create(email: "user2@email.com", password: "test123", password_confirmation: "test123")
puts "created user: #{user1.email}"
puts "created user: #{user2.email}"