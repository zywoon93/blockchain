
require 'securerandom'
require 'digest'
require 'httparty'

class Blockchain #class 다음의 문자는 꼭 대문자

	def initialize  
		@chain = []
		@trans = []
		@wallet = {} 
		@node =[]
		
	end

	def add_port(port)
		@node << port
	end

	def all_node
		@node
	end
	
	def ask_block
		@node.each do |n|
			n_block = HTTParty.get("http://localhost:"+n+"/number_of_blocks")
		if @chain.length < n_block.to_i
			@chain = []
		end
	end
end
	
	def show_all_wallet
		@wallet
	end

    
    def make_a_new_wallet # 새로운 지갑을 만들어라 
      address = SecureRandom.uuid.gsub("-", "") #gsub("-", "")은 하이픈을 공백으로 바꿔준다.
      @wallet[address] = 1000 # 지갑에 1000원을 넣어라.
      @wallet
      end	

	def make_a_trans(s, r, a) #(누가 누구에게 얼마를)
      if @wallet[s].nil? #보내는 지갑에 돈이 없다면 
      	"보내는 주소가 잘못되었습니다."
      elsif @wallet[r].nil? #받는 지갑에 돈이 없다면 
        "받는 주소가 잘못되었습니다."	
      elsif @wallet[s].to_f < a.to_f #보내는 사람이 가진  돈이 보내는 돈 보다 작다면
        "돈이 없습니다." 
      else
        
        @wallet[s] = @wallet[s].to_f - a.to_f 
        @wallet[r] = @wallet[r].to_f + a.to_f #.to_f는 유리수화 하라는 뜻

		trans = {
        "sender" => s,
        "receiver" => r,
        "amount" => a
		}
        @trans << trans
        @trans
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
		    @trans = []
		    @chain << block
	
	end

        def last_block
        @chain[-1]
        end

        def all_chains
        	@chain
        end

end
#uuid 특징 : 짧은 시간에 특수한 값을 만듬 uuid ruby는 SecureRandom 프로그램을 사용함.




