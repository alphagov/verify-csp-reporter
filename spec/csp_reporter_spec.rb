require './app.rb'

describe CspReporter do

	def app
		CspReporter.new!
	end

	it 'returns string from greeting' do
		expect(app.greeting).to eq 'Hello World'
	end

end