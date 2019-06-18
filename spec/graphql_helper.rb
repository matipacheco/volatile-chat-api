module Graphql

  class TestHelper

    @query_string = "
      mutation sendMessage($body: Json!){
        sendMessage(body: $body) {
          result
          errors
        }
      }
    "

    def self.build_params variables
      { "query" => @query_string, "variables" => { "body" => variables.as_json } }
    end

  end

end
