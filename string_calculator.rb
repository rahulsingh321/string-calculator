class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter = ','
    numbers   = numbers.gsub("\n", delimiter)
    nums      = numbers.split(delimiter).map(&:to_i)

    nums.sum
  end
end
