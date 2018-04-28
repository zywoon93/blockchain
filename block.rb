class Blockchain #class 다음의 문자는 꼭 대문자

	def initialize  
		@chain = [] #@처음부터 끝까지 관통하는 속성 
	end



	def mining
		history = [] 
		current_time = Time.now.to_f

		begin                      #begin-end 무한반복 로직 
			nonce = rand(100000)
			history << nonce #<<는 .push와 같다 			 
		    hashed = Digest::SHA256.hexdigest(nonce.to_s) #숫자 암호화
		end while hashed[0..3] != '0000'#0000으로 암호화된 숫자 찾기 
		nonce

		block = {
             "index" => @chain.size + 1,
             "time" => Time.now,
             "nonce" => nonce,
             "previous_address" => Digest::SHA256.hexdigest(last_block.to_s)
		}

		@chain << block
		block
	end

        def last_block
        @chain[-1]
        end

        def all_blocks
        	@chain
        end

end





