# encoding: UTF-8

require 'sinatra' 
require './block' 

b = Blockchain.new


get '/'do 
message = ""

 b.all_chains.each do |a|
 	message << a['indext'].to_s + "<br>"
end

message
end

get '/mine' do
	b.mining.to_s	
end