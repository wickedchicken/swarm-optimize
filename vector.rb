class optarry
	def initialize(size=50,range = {:min => 0.0, :max => 1.0}])
		run = range[:min] - range[:max]
		@arry = Array.new(size) {|x| (rand * range[:max]) - range[:min] }
	end

	def arry
		@arry
	end
end
