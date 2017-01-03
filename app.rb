ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'json'

class CspReporter < Sinatra::Base

	get '/' do
		'Content Security Policy'
	end

  get '/test' do
    status 200
  end

	post '/data' do
		begin
			@data = JSON.parse(request.body.read)
		rescue JSON::ParserError
			status 400
			return
		end

		if @data['csp-report']
      JSON.dump(@data)
		else
			status 400
    end
  end

	run! if app_file == $0
end