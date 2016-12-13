ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'json'

class CspReporter < Sinatra::Base

	get '/' do
		'Content Security Policy'
	end

	post '/data' do
		@data = JSON.parse(request.body.read)
		if @data['csp-report']
      JSON.dump(@data)
		else
			status 400
    end
  end

	run! if app_file == $0
end