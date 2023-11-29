class PlayersController < ApplicationController
  before_action :set_players, only: %i[show edit update]
  before_action :set_team

  def index
    @players = Player.all
  end

  def show
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.team = @team
    @player.save
    if @player.save
      redirect_to team_players_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @player.update(player_params)
    @player.save

    redirect_to team_player_path(@player)
  end

  private

  def set_players
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:first_name, :last_name, :birthdate, :position, :health, :availability, :photo)
  end

  def set_team
    @team = current_user.team
    # @team = Team.find(params[:team_id])
  end
end
