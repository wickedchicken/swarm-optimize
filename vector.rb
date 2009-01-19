# the main class that implements the particle swarm and training algorithms
#
# copyright Michael Stipicevic 2009
# see COPYING and COPYING.LESSER for details

class Swarm
	class BoundedArray < Array
		def [](idx)
			return self.at(idx) unless ((idx < 0) or (idx > self.length))
			if((idx < 0)) then
				return [self.at(0).at(0),0.0]
			else
				return [self.last.at(0),0.0]
			end

		end
	end

	def getslices
		side = (@win/2)
		# some inefficiencies
		slices = (-side..@arry.length-2-side).to_a.map {|i|
			(i..i+@win-1).to_a
		}

		return side,slices
	end
			
	def calc_nrg
		side,slices = getslices
		slices.each {|indices|
			idx = indices[side]

			idxes = indices.map {|x| @arry[x][0]}

			@arry[idx][1] = @nrg.call(idxes)
		}

		@arry.each {|x|
			puts x[0].to_s + "\t" + x[1].to_s
		}
	end

				
			
	# redo to be hash set
	def initialize(size=50,
		       range = {:min => 0.0,
		       :max => 1.0},
		       window = 3,
		       nrg_func = nil)
		run = range[:min] - range[:max]

		@nrg = lambda { |slice|
			# breaks down if window < 3
			# should be odd...
		
			idx = slice.length/2
			[idx,idx+1].map {|x| slice[x] - slice[x-1]}.inject {|accum,obj| accum + obj*obj }
		}

		@trainfunc = { |rate,slice|
			# breaks down if window < 3
			# should be odd...

			accum = Array.new(size) {|x| 0.0}

			idx = slice.length/2
			slopefunc = lambda {|x,i,slope| (slope-(x-i).abs.to_f)/slope}

			yi = @arry[slice[idx]][0]
			ei = @arry[slice[idx]][1]
			(0..slice.length-1).to_a.map {|q|
				modifier = slopefunc.call(slice[q],slice[idx],idx) * rate
				yx = @arry[slice[q]][0]
				ex = @arry[slice[q]][1]

				#you could also take into account whole slice instead of one...
				motion = (yi-yx)*(ex-yi) # go away from high energy regions

				accum[slice[q]] += modifier*motion}
			return accum
		}

		@nrg = nrg_func unless nrg_func.nil?
		@win = window
		@arry = BoundedArray.new(size) {|x| [(rand * run - range[:min]) , 0.0]}

		raise "window size less than swarm size" unless @arry.length > @win
		raise "window size less than three" unless @win >= 3
		raise "window size must be odd" unless (@win % 2 == 1)
	end

	def arry
		@arry
	end

	def train_step(
		side,slices = getslices
		slices.each {|indices|
			idx = indices[side]
	end
end
