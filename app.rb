require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/model'

get '/' do
	"Hello, World! Welcome to Wonders"
end
