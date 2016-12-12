require 'spec_helper'

feature "Request JSON", :js do

  describe 'home page' do
    it 'Application title' do
      visit 'http://localhost:4567/'
      expect(page).to have_content 'Content Security Policy'
    end
  end
end

