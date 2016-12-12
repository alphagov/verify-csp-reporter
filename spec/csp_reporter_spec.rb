require './app.rb'

describe CspReporter do
	def app
		CspReporter.new!
	end
end