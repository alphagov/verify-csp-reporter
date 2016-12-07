require File.dirname(__FILE__) + '/csp_reporter.rb'
require 'rspec'
#require 'spec_helper'
require 'rack/test'
require 'json'

set :environment, :test


describe 'The CSP app' do
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	json = {
  		"csp-report": {
    	"document-uri": "http://example.org/page.html",
    	"referrer": "http://evil.example.com/",
    	"blocked-uri": "http://evil.example.com/evil.js",
    	"violated-directive": "script-src 'self' https://apis.google.com",
    	"original-policy": "script-src 'self' https://apis.google.com; report-uri http://example.org/my_amazing_csp_report_parser"
  		}
	}


	it "receive a JSON CSP report-uri" do
		receive_json(json)
		expect(json).to include(:"csp-report") 
		#"csp-report" is the key value for the hash, that is why we have to use the ':' sign
	end
	


end