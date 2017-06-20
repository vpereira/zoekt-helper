require 'minitest/autorun'
require 'osc'

class OSCTest < Minitest::Test
	def test_initialize
		assert OSC.new("FOO", "BAR") != nil
	end
end
