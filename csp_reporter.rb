require 'sinatra'
require 'json'


def receive_json(data)
	json = JSON[data]
end




get '/' do	
	"Content Security Policy"
end

post '/' do
	@data = JSON.parse(request.body.read)
	puts @data
end