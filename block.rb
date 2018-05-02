
require 'securerandom'
require 'digest'

class Blockchain #class 다음의 문자는 꼭 대문자

	def initialize  
		@chain = []
		@trans = []
		@wallet = {}#@처음부터 끝까지 관통하는 속성 
	end
    
    def wallet_list
    	@wallet
    end

	def make_a_wallet
		address = SecureRandom.uuid.gsub("-", "")
		@wallet[address] = 100
         
        @wallet
     end


	def make_a_trans(s, r, a)
	   
       if @wallet[s].nil?
       	"Empty sender wallet"
       elsif @wallet[r].nil?
       	"Empty recipient wallet"
       elsif @wallet[s].to_f < a.to_f
       	"Short of money"
       else

       	@wallet[s] = @wallet[s] - a.to_f
       	@wallet[r] = @wallet[r] + a.to_f

		trans = {
			"sender" => s,
			"recv" => r,
			"amount" => a
		}
		@trans << trans #거래정보 저장
		"다음 블럭에 쓰여집니다." + (@chain.length + 1).to_s
	    end
end

	def mining
		
		begin                      #begin-end 무한반복 로직 
			nonce = rand(100000)
		 
		    hashed = Digest::SHA256.hexdigest(nonce.to_s) #숫자 암호화
		end while hashed[0..3] != '0000'#0000으로 암호화된 숫자 찾기 
		

		block = {
             "index" => @chain.size,
             "time" => Time.now.to_i,
             "nonce" => nonce,
             "previous_address" => Digest::SHA256.hexdigest(last_block.to_s),
		     "transaction" => @trans #블럭에 거래정보 박제 
		}
        @trans = [] # 새로운 블럭을 만들어라 
		@chain << block
	
	end

        def last_block
        @chain[-1]
        end

        def all_blocks
        	@chain
        end

end





