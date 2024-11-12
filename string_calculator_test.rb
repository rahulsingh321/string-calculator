require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = ::StringCalculator.new
  end

  def test_empty_string_returns_zero
    assert_equal 0, @calculator.add('')
  end

  def test_single_number_returns_value
    assert_equal 1, @calculator.add('1')
  end

  def test_two_numbers_comma_delimited
    assert_equal 6, @calculator.add("1,5")
  end

  def test_multiple_numbers_comma_delimited
    assert_equal 10, @calculator.add("1,2,3,4")
  end
end
