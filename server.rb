# encoding: UTF-8

require 'sinatra'
require './block'

set :port, 4568

blockchain = Blockchain.new

get '/add_node' do
	port = params["port"]
	blockchain.add_port(port)
end

get '/all_node' do
	blockchain.all_node.to_s
end
	
get '/number_of_blocks' do #블럭의 갯수
  blockchain.all_chains.size.to_s
end
 
get '/ask' do
  blockchain.ask_block.to_s
end

 get '/' do 

    message = "<center>"

    blockchain.all_chains.each do |b| #.each ->블럭을 하나씩 

	message << "Number      :" + b['index'].to_s + "<br>" #<br> 한줄 띄기 
	message << "Time        :" + b['Time'].to_s + "<br>" 
	message << "Nonce       :" + b['nonce'].to_s + "<br>" 
	message << "Pre-Address :" + b['previous_address'].to_s + "<br>"
	message << "My-Address  :" + Digest::SHA256.hexdigest(b.to_s) + "<br>"  
    message << "Transactions:" + b['transaction'].to_s + "<br>"
	message << "<hr>" # <hr>은 줄긋기 
                      #Digest::SHA256 암호화
    end

    message + "</center>"
    message 
end

get '/mine' do 
    blockchain.mining.to_s	# def mine의 결과를 브라우져에 표현해라  
 end


 get '/trans' do #trans 로직을 돌려라 
 	blockchain.make_a_trans(params["sender"], params["recv"], params["amount"]).to_s 
 
end

 get '/new_wallet' do 
    blockchain.make_a_new_wallet.to_s	
 end

 get '/all_wallet' do
 	blockchain.show_all_wallet.to_s
 end	


#http://localhost:4567/trans?sender=a&recv=b&amount=1.1 
#주                  소/trans?sender=보내는 사람 지갑주소&recv=받는 사람지갑주소&amount=보내는 양
