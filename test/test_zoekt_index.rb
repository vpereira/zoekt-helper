require 'minitest/autorun'
require_relative './helper'

class ZoektIndexTest < Minitest::Test
  def test_initialize
    assert !ZoektIndex.new('FOO').nil?
  end
end
