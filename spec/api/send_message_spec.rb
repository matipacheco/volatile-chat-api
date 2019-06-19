require 'pry'
require File.expand_path(File.dirname(__FILE__) + '/../rails_helper')

describe 'Send Message tests' do

  context 'Invalid request: missing participant' do

    it 'should raise invalid request exception' do
      unknown_sender = FactoryBot.build(:unknown_sender)

      post "/graphql", :params => Graphql::TestHelper.build_params(unknown_sender)
      graphql_response = JSON.parse(response.body)

      expect(graphql_response["data"]["sendMessage"]["errors"]).to be == "Invalid request: Expecting message sender"
    end

    it 'should raise Invalid request exception' do
      unknown_receiver = FactoryBot.build(:unknown_receiver)

      post "/graphql", :params => Graphql::TestHelper.build_params(unknown_receiver)
      graphql_response = JSON.parse(response.body)

      expect(graphql_response["data"]["sendMessage"]["errors"]).to be == "Invalid request: Expecting message receiver"
    end
  end


end