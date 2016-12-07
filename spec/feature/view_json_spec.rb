
ENV['RACK_ENV'] = 'test'

require File.dirname(__FILE__) + '/../../csp_reporter.rb'
require 'rspec'
require 'rack/test'
require 'spec_helper'
require 'json'
require 'capybara'
require 'capybara/dsl'
require 'test/unit'
#set :environment, :test

describe 'The CSP app' do
	include Rack::Test::Methods
	#include Capybara::DSL

include Capybara::DSL

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  #config.app_host = 'https://www.google.com' # change url
end

	def app
		Capybara.app = Sinatra::Application
	end


	it "receive a JSON CSP report-uri" do
		#visit 'http://localhost:4567/'
		session = Capybara::Session.new(:selenium)
#session.visit('http://www.google.com')
		session.visit "http://localhost:50130/test-rp"
		session.click_button('Start')
		session.execute_script("alert('Hello')")
				
		session.accept_alert('Hello')

		expect(session.response_headers).to include('csp-report') 
		#expect(page).to have_text('Verify')
	end
	


end