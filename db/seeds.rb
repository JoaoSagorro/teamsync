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

puts "Deleting the database"
Employee.destroy_all
Player.destroy_all
Team.destroy_all
User.destroy_all
Game.destroy_all
Cost.destroy_all

puts 'Creating new seeds'

puts '...'

puts 'Creating your Team manager'


puts 'User has been created'

puts '...'

puts 'Creating the team'

team = Team.new(
  {
    name: 'Liverpool Football club',
    sport: 'Football',
    stadium: 'Anfield',
    address: 'Anfield Rd, Anfield, Liverpool L4 0TH, United Kingdom',
    budget: 5_000_000
  }
)
team.save!

puts 'Team created'

puts '...'

puts 'Creating your Team manager'

team_manager = User.new({ email: 'team.manager@liverpool.com', password: '123456789', first_name: "Joao", last_name: "Sagorro" })
team_manager.team = team
team_manager.save!

puts 'Team manager has been created'

puts '...'

puts 'Creating Head Coach'

head_coach = User.new({ email: 'head.coach@liverpool.com', password: '123456789', first_name: "Bernado", last_name: "Ralao" })
head_coach.team = team
head_coach.save!

puts 'Head coach has been created'

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

def health()
  if rand(1..10) <= 8
    return "Available"
  else
    return ["Injured", "Limited"].sample
  end
end

def nutrition_restrictions()
  if rand(1..10) <= 7
    return "No restrictions"
  else
    return ["Nut allergy", "Ramadan", "Gluten intolerant", "Lactose free"].sample
  end
end

injury_notes_injured = [
  "Broken leg",
  "Fractured foot",
  "ACL injury",
  "Fractured wrist"
]

injury_notes_limited = [
  "Pubalgia",
  "Pattelar tendinopathy",
  "Returning from hamstring strain",
  "First game after ACL injury"
]

player_notes = {
  "Pubalgia" => "Limit number of change of direction and finalization drills",
  "Pattelar tendinopathy" => "Limit the number change of direction drills",
  "Returning from hamstring strain" => "Just 80% of max sprint distance",
  "First game after ACL injury" => "Max of 25min playing"
}

20.times do
  file = URI.open(images.pop)
  player_arr = []
  player = Player.new({
    first_name: Faker::Sports::Football.player.split.first,
    last_name: Faker::Sports::Football.player.split.last,
    position: Faker::Sports::Football.position,
    birthdate: Faker::Date.birthday(min_age: 18, max_age: 30),
    health: health(),
    preferred_side: ["Left", "Right"].sample,
    nutrition_restrictions: nutrition_restrictions()
  })
  player_arr << player
  player.team = team
  player.injury_notes =
    case player.health
    when "Injured"
      injury_notes_injured.sample
    when "Limited"
      injury_notes_limited.sample
    else
      ""
    end
  player.expected_return_date =
    case player.health
    when "Injured"
      Date.today + rand(5..10)
    else
      ""
    end
  player.note = player_notes[player.injury_notes]
  player.photo.attach(io: file, filename: "player.png", content_type: "image/jpeg")
  player.save!
end

puts 'All players created'

puts '...'

puts 'Creating games'

def outcome()
  if rand(1..10) <= 7
    return "Win"
  else
    return ["Draw", "Loss"].sample
  end
end

scores = {
  "Win" => 3,
  "Loss" => 0,
  "Draw" => 1
}

15.times do
  game = Game.new(
    date: Faker::Date.between(from: 2.month.ago, to: Date.today),
    location: ["Home", "Away"].sample,
    outcome: outcome(),
    opposition: Event::OPPONENTS.keys.sample
  )
  game.team = team
  game.score = scores[game.outcome]
  game.save!
end

puts 'All games created'

puts '...'

puts 'Creating purchases'

30.times do
  cost = Cost.new(
    date: Faker::Date.between(from: 6.months.ago, to: Date.today),
    description: Faker::Lorem.sentence,
    amount: Faker::Number.within(range: 75000..100000)
  )
  cost.team = team
  cost.remaining_budget = team.budget - cost.amount
  cost.save!
end

puts 'All purchases created'

puts '...'

puts 'Creating events'

event = Event.new({
  title: "Team Arrival",
  location: "Liverpool Academy",
  description: "Every player is expected to arrive at 8:30am",
  start_date: DateTime.strptime("12/09/2023 08:30", "%m/%d/%Y %H:%M"),
  end_date: DateTime.strptime("12/09/2023 09:00", "%m/%d/%Y %H:%M"),
  event_type: "Other"
})
event.team = team
event.players = Player.all
event.save!

puts "First event created"

event = Event.new ({
  title: "Lunch",
  location: "Cantine",
  description: "Team Lunch",
  start_date: DateTime.strptime("12/08/2023 10:30", "%m/%d/%Y %H:%M"),
  end_date: DateTime.strptime("12/08/2023 11:30", "%m/%d/%Y %H:%M"),
  event_type: "Other"
})
event.team = team
event.players = Player.all
event.employees = Employee.all
event.save!

puts "Second event created"

event = Event.new({
  title: "Monthly catch-up",
  location: "Board Room",
  description: "Discussion with coaches about players weights.",
  start_date: DateTime.strptime("12/08/2023 12:30", "%m/%d/%Y %H:%M"),
  end_date: DateTime.strptime("12/08/2023 14:15", "%m/%d/%Y %H:%M"),
  event_type: "Meeting"
})
event.team = team
event.players = Player.all
event.employees = Employee.all
event.save!

puts "Third event created"

event = Event.new({
  title: "Contract Discussion",
  location: "Head Office",
  description: "To discuss next seasons contract",
  start_date: DateTime.strptime("12/08/2023 16:00", "%m/%d/%Y %H:%M"),
  end_date: DateTime.strptime("12/08/2023 17:00", "%m/%d/%Y %H:%M"),
  event_type: "Meeting"
  })
event.team = team
event.players = [Player.first]
# event.employees = Employee.where(role: "Coach"),
event.save!

puts "Fourth event created"

event = Event.new({
  title: "Crystal Palace Match",
  location: "Anfield",
  description: "16th Premier League match of the season",
  start_date: DateTime.strptime("12/09/2023 14:00", "%m/%d/%Y %H:%M"),
  end_date: DateTime.strptime("12/09/2023 16:00", "%m/%d/%Y %H:%M"),
  event_type: "Match",
  opposition: 'Crystal Palace'
})
event.team = team
event.players = Player.where(health: "Available")
event.employees = Employee.all
event.save!

puts "Fifth event created"

event = Event.new({
  title: "Recovery Training",
  location: "Liverpool Academy",
  description: "Recovery training after match",
  start_date: DateTime.strptime("12/10/2023 10:00", "%m/%d/%Y %H:%M"),
  end_date: DateTime.strptime("12/10/2023 11:30", "%m/%d/%Y %H:%M"),
  event_type: "Training"
})
event.team = team
event.players = Player.where(health: "Available")
event.employees = Employee.all
event.save!

puts "Sixth event created"

event = Event.new({
  title: "Physio treatment",
  location: "Physio room",
  description: "Injured players only",
  start_date: DateTime.strptime("12/10/2023 9:00", "%m/%d/%Y %H:%M"),
  end_date: DateTime.strptime("12/10/2023 12:30", "%m/%d/%Y %H:%M"),
  event_type: "Physio"
})
event.team = team
event.players = Player.where(health: "Injured")
event.employees = Employee.where(role: 'Head of Physiotherapy')
event.save!

puts 'All events created'

puts '...'

puts 'Creating Chatrooms'

chatroom_name = ['Team chat', 'Players chat', 'Coaches chat', 'Physios', 'Performance']

puts '...'

chatroom = Chatroom.new({
  name: chatroom_name.pop
})
chatroom.team = team
event.save!

puts 'Chatrooms created'

puts '...'

puts 'Finished the seeding'
