class MessagesController < ApplicationController
  before_action :set_booking, only: [:index, :create]

def index
  @messages = Message.where(booking: @booking)
  @message = Message.new
  end

def create
  raise
  @chatroom = Chatroom.find_by(name: "master")
  @message = Message.new(message_params)
  @message.booking = @booking
  @message.user = current_user
  @message.chatroom = @chatroom
  if @message.save
  ChatroomChannel.broadcast_to(
  @chatroom,
  render_to_string(partial: "message", locals: { message: @message })
)
    redirect_to booking_messages_path(@booking, anchor: "message-#{@message.id}")
  else 
    render "index"
  end 
end 

private 

def message_params 
  params.require(:message).permit(:content)
end 

def set_booking 
  @booking = Booking.find(params[:booking_id])
end 

end
