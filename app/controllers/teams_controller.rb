class TeamsController < ApplicationController
  def show
    @team = current_user.team
    # @players = Player.where(health: "Available")
    @players = Player.where(health: "Injured").or Player.where(health: "Limited")
    # @players = @players.slice(0, 4)
    @events = Event.where(event_type: "Match")
  end

  def staff
    @team = current_user.team
    @players = Player.all
    @employees = Employee.all
  end

  def management
    @team = current_user.team
  end

  def chat
    @team = current_user.team
  end
end
