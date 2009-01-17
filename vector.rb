class Swarm
	# redo to be hash set
	def initialize(size=50,
		       range = {:min => 0.0,
		       :max => 1.0},
		       window = 3,
		       nrg_func = {|slice|
				   # breaks down if window < 3
				   idx = slice.length/2
				   [idx,idx+1].map({|x| slice[x] - slice[x-1]}).inject {|accum,obj| accum + obj*obj}
				  })
		run = range[:min] - range[:max]
		@nrg = nrg_func
		@window = 3
		@arry = Array.new(size) {|x| (rand * run - range[:min] }
	end

	def arry
		@arry
	end
end
