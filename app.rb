ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'json'

class CspReporter < Sinatra::Base

	get '/' do
		'Content Security Policy'
	end

	post '/data' do
		@data = JSON.parse(request.body.read)
    JSON.dump(@data)
  end

	run! if app_file == $0
end