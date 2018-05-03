# encoding: UTF-8

require 'sinatra'
require './block'

blockchain = Blockchain.new

get '/' do 
	message = "<center>"

	blockchain.all_blocks.each do |b|
		message << "BlockHeight	 	   : " + b['nHeight'].to_s + "<br>"
		message << "Time			   : " + b['nTime'].to_s + "<br>"
		message << "Nonce			   : " + b['nNonce'].to_s + "<br>"
		message << "Previous_BlockHash : " + b['previous_address'].to_s + "<br>"
		message << "Cur_BlockHash	   : " + Digest::SHA256.hexdigest(b.to_s) + "<br>"
		message << "Cur_Transation	   : " + b['Transaction'].to_s + "<br>"
		message << "<hr>"
	end

	message + "</center>"
	message
end

get '/mine' do
	blockchain.mining.to_s
end

get '/trans' do
	blockchain.make_a_trans(params["sender"], params["recv"], params["amount"])
end

get '/new_wallet' do
	blockchain.make_a_wallet.to_s
end

get 'wallet_list' do
	blockchain.show_all_wallet.to_s
end



