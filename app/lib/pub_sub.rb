require 'pry'

module PubSub

  @chat_room = ChatRoom.instance.chat_room

  # Class that holds the logic that allows us to publish a message in Redis.
  # Note: Im using Redis as a messaging system.
  class Publisher

    def self.publish_message body
      begin
        @chat_room.publish ENV["CHAT_ROOM_CHANNEL"], body.to_json

      rescue Exception => e
        puts e
      end
    end

  end

  # Class that holds the logic that allows us to read messages published on Redis.
  class Subscriber

    def self.message_received
      begin
        @chat_room.subscribe(ENV["CHAT_ROOM_CHANNEL"]) do |on|
          on.message do |channel, msg|
            data = JSON.parse(msg)
            puts "On " + channel + "\n"
            puts data["sender"] + "to" + data["receiver"] + ": " + data["message"]
          end
        end

      rescue Exception => e
        puts e
      end

    end

  end

end
