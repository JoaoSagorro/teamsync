class TeamsController < ApplicationController
  def show
    @team = current_user.team
    @players = Player.where(health: "Injured").or Player.where(health: "Limited")
    @players = @players.slice(0, 4)
  end

  def staff
    @team = current_user.team
    @players = Player.all
    @employees = Employee.all
  end
end
