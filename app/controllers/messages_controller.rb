class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    respond_to do |format|
      if @message.save
        ChatroomChannel.broadcast_to(
          @chatroom,
          message: render_to_string(partial: "chatrooms/message", locals: { message: @message }),
          sender_id: @message.user.id
        )
        head :ok
        Notification.create!(team: @team, column_name: "New Message", new_value: @message.chatroom.name)
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace('message-form', partial: "chatrooms/message",
          locals: { message: @message }, status: :unprocessable_entity)
        }
        # render "chatrooms/show", status: :unprocessable_entity
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end