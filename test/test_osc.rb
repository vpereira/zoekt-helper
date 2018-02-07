require 'minitest/autorun'
require_relative './helper'

class OSCTest < Minitest::Test
  def test_initialize
    assert OSC.new('FOO', 'BAR', File.join('test', 'sources')) != nil
  end
end
