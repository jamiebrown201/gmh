require 'features_helper'
describe Web::Controllers::Tfl::Index do
  let(:action) { Web::Controllers::Tfl::Index.new }
  let(:params) { Hash[] }

  describe '#call' do
    it 'has a succesful response' do
      response = action.call(params)
      expect(response[0]).to eq(200)
    end
  end
end
