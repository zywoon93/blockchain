class Blockchain
	def mining

	history = []	
		begin
			nonce = rand(100000) #rand()
			history << nonce
			hashed = Digest::SHA256.hexdigest(nonce.to_s)# number to letter
        end while hashed[0..3] != "0000"

    history.size
	end
end