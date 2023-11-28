class EventsController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @events = Events.all
    @event.team = @team
  end

  def show
    @event = Event.find(params[:id])
  end
end
