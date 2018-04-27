class Blockchain
	def mining

		begin
			nonce = rand(100000) #rand()
			hashed = Digest::SHA256.hexdigest(nonce.to_s)# number to letter
        end while hashed[0..3] != "0000"

    nonce
	end
end