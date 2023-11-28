class EventsController < ApplicationController
  def index
    @team = current_user.team
    @events = Event.all
  end

  def show
    @team = current_user.team
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @team = Team.find(params[:team_id])
  end

  def create
    @event = Event.new(set_params)
    @team = current_user.team
    @event.team = @team
    @event.save
    if @event.save
      redirect_to team_event_path(@event.team_id, @event.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:team_id])
    @team = current_user.team
    @event.team = @team
  end

  def update
    @event = Event.find(params[:team_id])
    @team = current_user.team
    @event.team = @team
    if @event.update(set_params)
      redirect_to team_event_path(@event.team_id, @event.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:event).permit(:title, :description, :location, :start_date, :end_date, :start_time, :end_time)
  end
end
