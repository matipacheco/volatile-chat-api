require 'redis'

# Singleton class that makes available a Redis
# instance to the rest of the classes of the project.
class ChatRoom
  include Singleton

  attr_accessor :chat_room

  def initialize
    @chat_room = Redis.new
  end

end
