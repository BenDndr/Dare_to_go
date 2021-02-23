class MessagesController < ApplicationController
  def create
    @dare = Dare.find(params[:dare_id])
    @challenge = Challenge.find(params[:challenge_id])
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
      @chatroom,
      render_to_string(partial: "message", locals: { message: @message })
      )     
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render '/challenges/<%= params[:challenge_id] %>/dares/<%= :dare_id %>/messages'
    end
  end
end
