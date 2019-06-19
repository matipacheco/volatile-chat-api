require 'pry'

module PubSub

  @chat_room = ChatRoom.instance.chat_room

  def self.publish body
    begin
      @chat_room.publish ENV["CHAT_ROOM_CHANNEL"], body.to_json

    rescue Exception => e
      e
    end
  end
end
