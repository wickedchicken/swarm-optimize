# test cases to make sure everything is working OK
#
# copyright Michael Stipicevic 2009
# see COPYING and COPYING.LESSER for details

require 'test/unit'
load 'vector.rb'

class Creation < Test::Unit::TestCase
	def test_default
		assert(Swarm.new,'could not create default Swarm object')
		#test that values are random, etc
	end

	def test_nrg_default
		swarm = Swarm.new
		assert(swarm.calc_nrg,'could not calculate energy')
		#check that function is working properly, etc
	end

	def test_train_default
		swarm = Swarm.new
		assert(swarm.train,'could not train the swarm')
end
