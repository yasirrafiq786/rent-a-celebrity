class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find_by(name: "master")
    stream_for chatroom
  end
end
