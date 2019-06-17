require 'securerandom'

class UnknownSender
  attr_accessor :receiver, :message
end

class UnknownReceiver
  attr_accessor :sender, :message
end

FactoryBot.define do
  factory :unknown_sender do
    receiver { SecureRandom.hex }
    message  { "This is a test message" }
  end

  factory :unknown_receiver do
    sender { SecureRandom.hex }
    message  { "This is a test message" }
  end
end
