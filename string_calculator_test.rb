require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = ::StringCalculator.new
  end

  def test_empty_string_returns_zero
    assert_equal 0, @calculator.add('')
  end
end
