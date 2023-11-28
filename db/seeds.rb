# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Team.destroy_all

puts "Creating user.."

user = User.create!({
  email: "km@gmail.com",
  password: '123456789'
})
puts "User created"


puts "Creating team.."
team = Team.new ({
  name: "Liverpool FC",
  sport: "Football",
  stadium: "Anfield",
  address: "Anfield Road, Liverpool",
  budget: 10000000
})
team.user = user
team.save!


puts "Creating player"

player = Player.new ({
  first_name: "Mo",
  last_name: "Salah",
  position: "Forward",
  health: "Fit to play",
  availability: "Available",
  birthdate: Date.new(1992, 06, 15)
})
player.team = team
player.save!


puts "Player created"
