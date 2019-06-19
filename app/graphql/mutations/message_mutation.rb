module Mutations
  class SendMessage < Mutations::BaseMutation
    argument :body, Types::JsonType, required: true

    # Push a message to Redis, since Im using Redis as a message broker
    def resolve(body:)
      begin
        check_for_participants(body)

        PubSub.publish(body)

        { :result => "success" }

      rescue Exception => e
        { :result => "error", :errors => e.as_json }

      end
    end

    private

    def check_for_participants body
      unless body.has_key? "sender"
        raise "Invalid request: Expecting message sender"
      end

      unless body.has_key? "receiver"
        raise "Invalid request: Expecting message receiver"
      end
    end

  end
end
