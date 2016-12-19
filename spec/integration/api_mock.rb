require 'spec_helper'
require 'webmock/rspec'

  feature "Mock JSON request", :js do

  def app
    CspReporter
  end

  let(:base_uri) {'http://localhost:4567'}


  describe 'CSP Report Application' do
    it 'should receive JSON from an api' do
    	stub_request(:post, "www.example.com").with(body: {data: {a: '1', b: 'five'}})

    	post('www.example.com', '{"data":{"a":"1","b":"five"}}',content_type: 'application/json')
  		expect(JSON.parse(last_response.body)).to eq('{"data":{"a":"1","b":"five"}}')
    end
  end
end