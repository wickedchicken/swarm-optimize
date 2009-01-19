require 'test/unit'
load 'vector.rb'

class Creation < Test::Unit::TestCase
	def test_default
		assert Swarm.new
	end
end
