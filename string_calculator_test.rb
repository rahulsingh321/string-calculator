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

  def test_newlines_between_numbers
    assert_equal 6, @calculator.add("1\n2,3")
  end

  def test_custom_delimiter
    assert_equal 3, @calculator.add("//;\n1;2")
  end

  def test_negative_numbers_throw_exception
    error = assert_raises RuntimeError do
      @calculator.add("1,-2,3")
    end
    assert_equal "negative numbers not allowed: -2", error.message
  end

  def test_multiple_negative_numbers_throw_exception
    error = assert_raises RuntimeError do
      @calculator.add("1,-2,-3")
    end
    assert_equal "negative numbers not allowed: -2, -3", error.message
  end
end
