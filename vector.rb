class Swarm
	class BoundedArray < Array
		def [](idx)
			return self[idx] unless ((idx < 0) or (idx > self.length))
			return 0.0
		end
	end
	@nrg = { |slice|
		# breaks down if window < 3
		# should be odd...
		idx = slice.length/2
		[idx,idx+1].map({|x| slice[x] - slice[x-1]}).inject {|accum,obj| accum + obj*obj }
	}

	@trainfunc = { |rate,slice|
		# breaks down if window < 3
		# should be odd...
		idx = slice.length/2
		yi = slice[idx]
		ei = rate
		slice.length.times.map {|x|
			

	# redo to be hash set
	def initialize(size=50,
		       range = {:min => 0.0,
		       :max => 1.0},
		       window = 3,
		       nrg_func = nil)
		run = range[:min] - range[:max]

		@nrg = nrg_func unless nrg_func.is_nil?
		@win = window
		@arry = Array.new(size) {|x| (rand * run - range[:min] }
		raise "window size less than swarm size" unless @arry.length > @win
	end

	def arry
		@arry
	end

	def train(niter = 1)
		slices = (@arry.length-@win).times {|i| @arry[i,@win]}
		rates = slices.map @nrg
		rates.zip(slices).map @trainfunc
	end
end
