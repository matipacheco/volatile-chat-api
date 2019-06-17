require File.expand_path(File.dirname(__FILE__) + '/../rails_helper')

describe 'Send Message tests' do

  context 'Unknown participants' do

    it 'should raise invalid request exception' do
      unknown_sender = FactoryBot.build(:unknown_sender)

      Graphql::TestHelper.test_query(unknown_sender)
    end

    # it 'should raise Invalid request exception' do
    #   unknown_receiver = FactoryBot.build(:unknown_receiver)
    #
    #   Graphql::TestHelper.test_query(:unknown_receiver)
    # end
  end


end