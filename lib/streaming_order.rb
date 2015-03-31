class StreamingOrder

  def initialize(input)
    @input = input
  end

  def each
    @input.each_line do |line|
      yield OrderItem.parse(line)
    end
  end

end
