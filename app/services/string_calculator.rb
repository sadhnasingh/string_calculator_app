class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers == ''
    return numbers.to_i if numbers =~ /\A-?\d+\z/
    str = numbers.dup
    delimiters = [',', "\n"]
    if str.start_with?('//')
      header, str = str.split("\n", 2)
      delimiters << header[2..-1]
    end

    regex = Regexp.union(*delimiters.map { |d| Regexp.new(Regexp.escape(d)) })
    str.split(regex).reject(&:empty?).map(&:to_i).sum
  end
end