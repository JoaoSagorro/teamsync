class TeamsController < ApplicationController
  def show
    @team = current_user.team
    # @team = Team.find(params[:id])
  end

  def staff
    @team = current_user.team
    @players = Player.all
    @employees = Employee.all
  end
end
