require 'open-uri'

images = [
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262182/liverpool%20fc/qmzksomaxucuxmdimsot.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262182/liverpool%20fc/v9qakwe8uhahytybfmrh.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701268967/liverpool%20fc/aatborarwcav3uojibam.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262182/liverpool%20fc/vlh32a7zs94au5ghteno.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262182/liverpool%20fc/g4iftodzcgsxabytqtvw.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262182/liverpool%20fc/gmn3j73fyzdxxeqk91zt.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262182/liverpool%20fc/xlzf8bw73v7palgok7be.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262182/liverpool%20fc/trtp8kqjqu3stu74our4.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262181/liverpool%20fc/gvdpsyfjccydccwjjvdu.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262181/liverpool%20fc/cm0krknnydhqku6a2phm.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262181/liverpool%20fc/m4p8tcmldzzfjqfilnh1.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262181/liverpool%20fc/pujiaeq0gnuvgmfxa5v1.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262181/liverpool%20fc/wcb62vx5dr0pr3hxtyps.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262180/liverpool%20fc/pyvw9igzkkizmlfskmw7.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262181/liverpool%20fc/uviphz7spqgdhbwf8coc.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262180/liverpool%20fc/qwedqrexluazsfp8kblo.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262180/liverpool%20fc/qgqbiycknzgnawitbhf5.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262181/liverpool%20fc/fda8ksdzrul9jovr9yy9.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262180/liverpool%20fc/rochxotcwutxrjhefmj0.png",
  "https://res.cloudinary.com/dezhqd5rm/image/upload/v1701262180/liverpool%20fc/bwlfljt4udn9zbuo2c3n.png"
]

def health()
  if rand(1..10) <= 8
    return "Available"
  else
    return ["Injured", "Limited"].sample
  end
end

puts "Deleting the database"
Employee.destroy_all
Player.destroy_all
User.destroy_all
Team.destroy_all


puts 'Creating new seeds'

puts '...'


puts 'Creating your Team manager'

user = User.new({ email: 'team.manager@liverpool.com', password: '123456789', first_name: "Joao", last_name: "Sagorro" })
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

20.times do
  file = URI.open(images.pop)
  player_arr = []
  player = Player.new({
    first_name: Faker::Sports::Football.player.split.first,
    last_name: Faker::Sports::Football.player.split.last,
    position: Faker::Sports::Football.position,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 30),
    health: health()
  })
  player_arr << player
  player.team = team
  player.photo.attach(io: file, filename: "player.png", content_type: "image/jpeg")
  player.save!
end

puts 'All players created'

puts 'Finished the seeding'

event = Event.new ({
 title: "Gym Session",
 location: "Gym 1",
 description: "Upper body session",
 start_date: DateTime.strptime("12/01/2023 08:30", "%m/%d/%Y %H:%M"),
 end_date: DateTime.strptime("12/01/2023 09:15", "%m/%d/%Y %H:%M"),
 event_type: "Gym"
}
)
event.team = team
event.players = Player.all
event.save!

event = Event.new ({
  title: "Monthly catch-up",
  location: "Board Room",
  description: "Discussion with coaches about players weights.",
  start_date: DateTime.strptime("12/01/2023 12:30", "%m/%d/%Y %H:%M"),
  end_date: DateTime.strptime("12/01/2023 14:15", "%m/%d/%Y %H:%M"),
  event_type: "Meeting"
})
event.team = team
event.players = Player.all
event.employees = Employee.all
event.save!

event = Event.new ({
  title: "Contract Discussion",
  location: "Head Office",
  description: "To discuss next seasons contract",
  start_date: DateTime.strptime("12/01/2023 16:00", "%m/%d/%Y %H:%M"),
  end_date: DateTime.strptime("12/01/2023 17:00", "%m/%d/%Y %H:%M"),
  event_type: "Meeting"
 })
event.team = team
event.players = [Player.first]
# event.employees = Employee.where(role: "Coach"),
event.save!


event = Event.new ({
  title: "Fulham Match",
  location: "Anfield",
  description: "Fulham",
  start_date: DateTime.strptime("12/03/2023 14:00", "%m/%d/%Y %H:%M"),
  end_date: DateTime.strptime("12/03/2023 16:00", "%m/%d/%Y %H:%M"),
  event_type: "Match"
})
event.team = team
event.players = Player.where(health: "Available")
event.employees = Employee.all
event.save!
