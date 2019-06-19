require 'pry'

module PubSub

  @chat_room = ChatRoom.instance.chat_room

  def self.publish channel = ENV["CHAT_ROOM_CHANNEL"], body
    begin
      @chat_room.publish channel, body.to_json

    rescue Exception => e
      e
    end
  end
end
