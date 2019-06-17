require 'pry'
require 'securerandom'

module Graphql

  class TestHelper

    @query_string = "
      mutation sendMessage($body: Json!){
        sendMessage(body: $body) {
          result
          errors
        }
      }
    ".delete!("\n")

    def self.setup variables
      { "query" => @query_string, "body" => variables.as_json }
    end

    def self.test_query variables
      post "/graphql", params: setup(variables)
    end

  end

end