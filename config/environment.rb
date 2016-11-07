#Configuration file
#===================
#Responsibility for booting up the application and loading the gems 
#from the Bundler. Also loads and sets up active support for the project.

require "rubygems"
require "bundler"

Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)

#require "active_support/deprecation"
#require "active_support/all"