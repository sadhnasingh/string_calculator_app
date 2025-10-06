class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers == ''
    return numbers.to_i if numbers =~ /\A-?\d+\z/
    numbers.split(',').map(&:to_i).sum
  end
end