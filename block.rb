class Blockchain
	def initialize 
		@chain = []
	end

	def mining

	history = []	
		begin
			nonce = rand(100000) #rand()
			history << nonce
			hashed = Digest::SHA256.hexdigest(nonce.to_s)# number to letter
        end while hashed[0..3] != "0000"

    block = {
	"index" => 1,
	"time" => 20329384,
	"nonce" => 3234
}


    history.size
	end
end