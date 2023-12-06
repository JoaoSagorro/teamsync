class TeamsController < ApplicationController
  def show
    @team = current_user.team
    # @players = Player.where(health: "Available")
    @players = Player.where(health: "Injured").or Player.where(health: "Limited")
    # @players = @players.slice(0, 4)

    # the messed up KickChart stuff goes here
    players = Player.all
    games = Game.order(date: :asc)

    # CumulativeScore - LineChart
    cumulative_score_data = {}
    cumulative_score = 0

    points = {
      'Win' => 3,
      'Draw' => 1,
      'Loss' => 0
    }

    games.each do |game|
      cumulative_score += points[game.outcome]

      cumulative_score_data[game.date] = cumulative_score
    end

    @cumulative_score_data = cumulative_score_data

    # PlayerHealth - PieChart
    @health_chart_data = players.group(:health).count.transform_keys do |health|
      case health
      when 'Available'
        'Available'
      when 'Injured'
        'Injured'
      else
        'Limited'
      end
    end

    # Costs - LineChart
    costs = @team.costs.order(date: :asc)
    cost_chart_data = costs.group("DATE(date)").sum(:amount)

    remaining_budget = @team.budget

    cost_chart_data.each do |date, cost|
      remaining_budget -= cost
      cost_chart_data[date] = remaining_budget
    end

    @cost_chart_data = cost_chart_data
    @matches = Event.where(event_type: "Match").order(start_date: :asc)
    @notifications = Notification.order(created_at: :desc)
    @todays_events = Event.order(start_date: :asc).select { |event| event.start_date.to_date == Date.today }
  end

  def staff
    @team = current_user.team
    @players = Player.all
    @employees = Employee.all
  end

  def chatrooms
    @team = current_user.team
    @chatrooms = Chatroom.all
  end

  def management
    @team = current_user.team
  end
end
