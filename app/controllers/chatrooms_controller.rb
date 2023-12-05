class ChatroomsController < ApplicationController
  before_action :current_team

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatrooms = Chatroom.all
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
    @team = Team.find(params[:team_id])
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.team = @team
    @chatroom.save
    if @chatroom.save
      @chatroom.team_id = params[:team_id] || []
      redirect_to team_chatrooms_path(@chatroom.team_id, @chatroom.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def current_team
    @team = current_user.team
  end

  def chatroom_params
    params.require(:chatroom).permit(:name, :team_id)
  end
end
