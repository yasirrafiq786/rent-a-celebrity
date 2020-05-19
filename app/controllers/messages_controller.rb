class MessagesController < ApplicationController
  before_action :set_booking, only: [:index, :create]

def index
  @messages = Message.where(booking: @booking)
  @message = Message.new
  end

def create
  @message = Message.new(message_params)
  @message.booking = @booking
  @message.user = current_user
  @message.chatroom = Chatroom.find_by(name: "master") 
  if @message.save
    redirect_to booking_messages_path(@booking)
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
