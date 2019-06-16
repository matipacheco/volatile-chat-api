require 'securerandom'

class GraphqlHelper

  query_string = "
    mutation sendMessage($body: Json!){
      sendMessage(body: $body) {
        result
        errors
      }
    }
  "

  variables = {
      "body" => {
          "sender"    => SecureRandom.hex,
          "receiver"  => SecureRandom.hex,
          "message"   => "This is a test message"
      }
  }

  VolatileChatApiSchema.execute(query_string, variables: variables)

end