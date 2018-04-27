# encoding: UTF-8

require 'sinatra'
require './block'

b = Blockchain.new


get '/'do 
"It's block list."
	
end

get '/mine' do
	b.mining.to_s
	
end