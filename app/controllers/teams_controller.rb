class TeamsController < ApplicationController
  def show
    @team = current_user.team
    # @team = Team.find(params[:id])
  end
end
