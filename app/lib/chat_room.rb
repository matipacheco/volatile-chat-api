require 'redis'

class ChatRoom
  include Singleton

  attr_accessor :chat_room

  def initialize
    @chat_room = Redis.new
  end

end
