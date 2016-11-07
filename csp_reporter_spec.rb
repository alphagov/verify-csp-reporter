require File.dirname(__FILE__) + '/csp_reporter.rb'
require 'rspec'
#require 'spec_helper'
require 'rack/test'

set :environment, :test


describe 'The CSP app' do
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	it "says Content Security Policy" do
		get '/'
		expect(last_response).to be_ok
		expect(last_response.body).to eq('Content Security Policy')
	end
end