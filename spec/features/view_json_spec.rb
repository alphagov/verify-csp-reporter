require 'spec_helper'
require 'json'

feature "Request JSON", :js do

  def app
    CspReporter
  end

  let(:base_uri) {'http://localhost:4567'}

  let(:file) {File.read('spec/features/data.json')}
  let(:unacceptable_parsed_json_file) {File.read('spec/features/unacceptable_data.json')}
  let(:invalid_json) {File.read('spec/features/invalid.json')}
  let(:acceptable_parsed_json) {JSON.parse(file)}

  describe 'CSP Report Application' do
    it 'should return status 200' do
      post '/data', file, {}
      expect(last_response.status).to eq(200)
    end

    it 'should deserialize json' do
      post '/data', file, {}
      expect(JSON.parse(last_response.body)).to eq(acceptable_parsed_json)
    end

    it 'should not accept JSON without csp-report key' do
      post '/data', unacceptable_parsed_json_file, {}
      expect(last_response.status).to eq(400)
    end

    it 'should not accept invalid JSON' do
      post '/data', invalid_json, {}
      expect(last_response.status).to eq(400)
    end
  end
end

