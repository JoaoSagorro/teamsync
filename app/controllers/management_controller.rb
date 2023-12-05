class ManagementController < ApplicationController
  def index
    @team = current_user.team
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
    @health_chart_data = @team.players.group(:health).count.transform_keys do |health|
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
  end
end
