puts "Deleting the database"
Employee.destroy_all
Player.destroy_all
User.destroy_all
Team.destroy_all


puts 'Creating new seeds'

puts '...'


puts 'Creating your Team manager'

user = User.new({ email: 'team.manager@liverpool.com', password: '123456789' })
user.save!

puts 'User has been created'

puts '...'

puts 'Creating the team'

team = Team.new({
    name: 'Liverpool Football club',
    sport: 'Football',
    stadium: 'Anfield',
    address: 'Anfield Rd, Anfield, Liverpool L4 0TH, United Kingdom',
    budget: 10_000_000})
team.user = user
team.save!

puts 'Team created'

puts '...'


puts 'Creating Employees'
roles = [
  'Coach',
  'Assistant Coach',
  'First-team Goalkeeping Coach',
  'First-team Assistant Goalkeeping Coach',
  'Goalkeeping Coach',
  'Elite Development Coach',
  'Head of Fitness and Conditioning',
  'Head of Recovery and Performance',
  'Head of Physiotherapy',
  'Club Doctor',
  'Post-Match & Elite Player Development Analyst',
  'First-Team Fitness Coach',
  'Masseur',
  'Kit Management Co-ordinator',
  'Head of Nutrition'
]

15.times do
  employee = Employee.new({
      first_name: Faker::Sports::Football.coach.split.first,
      last_name: Faker::Sports::Football.coach.split.last,
      role: roles.pop,
      birthdate: Faker::Date.birthday(min_age: 35, max_age: 65)
  })
  employee.team = team
  employee.save!
end

puts 'All employees created'

puts '...'

puts 'Creating players'

32.times do
  player = Player.new({
    first_name: Faker::Sports::Football.player.split.first,
    last_name: Faker::Sports::Football.player.split.last,
    position: Faker::Sports::Football.position,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 30)
  })
  player.team = team
  player.save!
end

puts 'All players created'

puts 'Finished the seeding'
