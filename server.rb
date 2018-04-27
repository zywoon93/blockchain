# encoding: UTF-8

require 'sinatra' 
require './block' 

b = Blockchain.new


get '/'do 
message = ""

 b.all_chains.each do
end

get '/mine' do
	b.mining.to_s	
end