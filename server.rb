# encoding: UTF-8

require 'sinatra' 
require './block' 

b = Blockchain.new


get '/'do 
message = ""

 b.all_chains.each do |a|
 	
 	message << "번호는 : " +a["index"].to_s + "<br>"
 	message << "nonce는 : " +a["nonce"].to_s + "<br>"
 	message << "시간은 : " +a["time"].to_s + "<br>"
 	message << "앞주소는 : " +a["previous_address"].to_s + "<br>"
 	message << "내주소는 : " +Digest::SHA256.hexdigest(a.to_s) + "<br>"
 	message << "<hr>"
end

message
end

get '/mine' do
	b.mining.to_s	
end