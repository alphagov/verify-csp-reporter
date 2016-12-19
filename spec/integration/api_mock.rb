require 'spec_helper'

feature "Mock JSON request", :js do

  def app
    CspReporter
  end

  let(:csp_report_uri) { 'http://localhost:4567/data' }
  let(:frontend_uri) { 'https://www.signin.service.gov.uk/start' }

  describe 'CSP Report Application' do
    it 'should receive JSON from an api' do
      get '/test'
      expect(last_response.status).to eq(200)
    end
  end
end