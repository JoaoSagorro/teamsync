class PlayersController < ApplicationController
  before_action :set_players, only: %i[show edit update]
  before_action :set_team

  def index
    @players = Player.all
    if params[:search].present?
      search_player
    end
  end

  def show
    @events = @player.events.order(start_date: :asc)
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
    if @player.saved_change_to_health?
      Notification.create!(team: @team, player: @player, note: "Health Update", column_name: "Player")
    elsif @player.saved_change_to_note?
      Notification.create!(team: @team, player: @player, note: "Player Update", column_name: "Player")
    elsif @player.saved_change_to_nutrition_restrictions?
      Notification.create!(team: @team, player: @player, note: "Nutrition Update", column_name: "Player")
    elsif @player.saved_change_to_expected_return_date?
      Notification.create!(team: @team, player: @player, note: "Return Update", column_name: "Player" )
    end
    redirect_to team_player_path(@player)
    @player.save

  end

  private

  def search_player
    PgSearch::Multisearch.rebuild(Player)
    results = PgSearch.multisearch(params[:search])
    @players = results.map { |player| player.searchable}
  end

  def set_players
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(
      :first_name,
      :last_name,
      :birthdate,
      :position,
      :health,
      :availability,
      :photo,
      :note,
      :nutrition_restrictions,
      :injury_notes,
      :preferred_side,
      :expected_return_date
    )
  end

  def set_team
    @team = current_user.team
    # @team = Team.find(params[:team_id])
  end
end
