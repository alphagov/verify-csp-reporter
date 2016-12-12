require 'spec_helper'
require 'json'

feature "Request JSON", :js do

  def app
    CspReporter
  end

  let(:base_uri) {'http://localhost:4567'}

  let(:file) {File.read('spec/features/data.json')}
  let(:parsed_json) {JSON.parse(file)}

  describe 'CSP Report Application' do
    it 'should return status 200' do
      post '/data', file, {}
      expect(last_response.status).to eq(200)
    end

    it 'should deserialize json' do
      post '/data', file, {}
      expect(JSON.parse(last_response.body)).to eq(parsed_json)
    end
  end
end

