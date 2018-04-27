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
	"index" => @chain.size + 1,
	"time" => time.now,
	"nonce" => nonce
}
     @chain << block

    history.size
	end
end