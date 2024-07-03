class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ','
    if numbers.start_with?('//')
      delimiter, numbers = parse_custom_delimiter(numbers)
    end

    numbers   = numbers.gsub("\n", delimiter)
    nums      = numbers.split(delimiter).map(&:to_i)

    nums.sum
  end

  private

  def parse_custom_delimiter(numbers)
    parts     = numbers.split("\n", 2)
    delimiter = parts[0][2..-1]
    [delimiter, parts[1]]
  end
end
