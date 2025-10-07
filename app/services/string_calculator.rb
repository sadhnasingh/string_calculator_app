class StringCalculator
  def add(numbers)
    return 0 if numbers.nil? || numbers == ""
    return numbers.to_i if numbers =~ /\A-?\d+\z/

    str = numbers.dup
    delimiters = [",", "\n"]

    if str.start_with?("//")
      header, str = str.split("\n", 2)
      custom = header[2..-1]
      if custom.start_with?("[")
        delimiters += custom.scan(/\[(.+?)\]/).flatten
      else
        delimiters << custom
      end
    end

    regex = Regexp.union(*delimiters.map { |d| Regexp.new(Regexp.escape(d)) })
    tokens = str.split(regex).reject(&:empty?)
    ints = tokens.map(&:to_i)

    negatives = ints.select { |n| n < 0 }
    unless negatives.empty?
      raise ArgumentError, "Negatives not allowed: #{negatives.join(",")}"
    end

    ints.reject { |n| n > 1000 }.sum
  end
end