class Dog

	def initialize
		@weight = 0.5
		@age = 1
end

def my_weight
	puts "현재 몸무게 :" + @weight.to_s
end

def eat
	@previous_weight = @weight
	@weight = @weight + 0.5
	puts "eating"
end

def run
	puts "running"
end

end

aaaaa = Dog.new
aaaaa.my_weight
aaaaa.eat
aaaaa.my_weight

