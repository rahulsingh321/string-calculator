# frozen_string_literal: true

# String calculator
class StringCalculator
  def initialize
    @call_count = 0
  end

  def add(numbers)
    @call_count += 1
    return 0 if numbers.empty?

    delimiter = ','
    delimiter, numbers = parse_custom_delimiter(numbers) if numbers.start_with?('//')

    numbers   = numbers.gsub("\n", delimiter)
    nums      = numbers.split(delimiter).map(&:to_i)

    # Ignore numbers greater than 1000
    nums.reject! { |n| n > 1000 }

    negatives = nums.select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    nums.sum
  end

  def called_count
    @call_count
  end

  private

  def parse_custom_delimiter(numbers)
    parts     = numbers.split("\n", 2)
    delimiter = parts[0][2..-1]
    [delimiter, parts[1]]
  end
end
