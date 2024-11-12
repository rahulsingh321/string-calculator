# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'string_calculator'

# Test suite for string calculator
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
    assert_equal 6, @calculator.add('1,5')
  end

  def test_multiple_numbers_comma_delimited
    assert_equal 10, @calculator.add('1,2,3,4')
  end

  def test_newlines_between_numbers
    assert_equal 6, @calculator.add("1\n2,3")
  end

  def test_custom_delimiter
    assert_equal 3, @calculator.add("//;\n1;2")
  end

  def test_many_numbers_custom_delimiter
    assert_equal 15, @calculator.add("//|\n1|2|3|4|5")
  end

  def test_delimiters_of_any_length
    assert_equal 6, @calculator.add("//***\n1***2***3")
    assert_equal 10, @calculator.add("//$$$$\n1$$$$2$$$$3$$$$4")
  end

  def test_negative_numbers_throw_exception
    error = assert_raises RuntimeError do
      @calculator.add('1,-2,3')
    end
    assert_equal 'negative numbers not allowed: -2', error.message
  end

  def test_multiple_negative_numbers_throw_exception
    error = assert_raises RuntimeError do
      @calculator.add('1,-2,-3')
    end
    assert_equal 'negative numbers not allowed: -2, -3', error.message
  end

  def test_get_called_count
    assert_equal 0, @calculator.get_called_count
    @calculator.add('1,2,3')
    assert_equal 1, @calculator.get_called_count
    @calculator.add('4,5')
    assert_equal 2, @calculator.get_called_count
  end

  def test_ignore_numbers_greater_than_1000
    assert_equal 9, @calculator.add('2,1001,1002,3,4')
    assert_equal 2, @calculator.add('1001,2')
    assert_equal 0, @calculator.add('1001,1002')
  end
end
