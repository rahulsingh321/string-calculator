class StringCalculator
  def initialize
    @call_count = 0
  end

  def add(numbers)
    @call_count += 1
    return 0 if numbers.empty?

    delimiter = ','
    if numbers.start_with?('//')
      delimiter, numbers = parse_custom_delimiter(numbers)
    end

    numbers   = numbers.gsub("\n", delimiter)
    nums      = numbers.split(delimiter).map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    if negatives.any?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    nums.sum
  end

  def get_called_count
    @call_count
  end

  private

  def parse_custom_delimiter(numbers)
    parts     = numbers.split("\n", 2)
    delimiter = parts[0][2..-1]
    [delimiter, parts[1]]
  end
end
