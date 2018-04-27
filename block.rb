class Blockchain
	def mining

		begin
			nonce = rand(10000) #rand()
        end while Digest::SHA256.hexdigst(nonce.to_s) +

    nonce
	end
end