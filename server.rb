# encoding: UTF-8

require 'sinatra' 
require './block' 

b = Blockchain.new


get '/'do 
message = ""

 b.all_chains.each do |a|
 	message << "번호는 : " +a["index"].to_s + "<br>"
 	message << "<hr>"
end

message
end

get '/mine' do
	b.mining.to_s	
end