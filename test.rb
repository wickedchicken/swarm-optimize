require 'test/unit'
load 'vector.rb'

class Creation < Test::Unit::TestCase
	def test_default
		assert(Swarm.new,'could not create default Swarm object')
	end

	def test_nrg_default
		swarm = Swarm.new
		assert(swarm.calc_nrg,'could not calculate energy')
	end
end
