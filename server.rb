# encoding: UTF-8
require 'sinatra' #시나트라가 필요하다 
require './block' #블럭파일을 불러와라 

aaaa = Blockchain.new



 get'/' do 

message = "<center>"
aaaa.all_blocks.each do |b| #.each블럭을 하나씩 
	message << "Number :" + b['index'].to_s + "<br>" 
	message << "Time :" + b['Time'].to_s + "<br>" 
	message << "Nonce :" + b['nonce'].to_s + "<br>" 
	message << "Pre-Address :" + b['previous_address'].to_s + "<br>"
	message << "My-Address :" +Digest::SHA256.hexdigest(b.to_s) + "<br>"  
    message << "Transactions: "+ b["transaction"].to_s + "<br>"
	message << "<hr>" # <hr>은 줄긋기 
#Digest::SHA256 암호화
end

message + "</center>"

end

get '/mine' do 
aaaa.mining.to_s	# def mine의 결과를 브라우져에 표현해라  
 end

 get '/trans' do
 	aaaa.make_a_trans(params["sender"], params["recv"], params["amount"])
 end

get '/new_wallet' do
	aaaa.make_a_wallet.to_s
end

get '/wallet_list' do
	aaaa.wallet_list.to_s
end
