class StreamingOrder

  def initialize(input, stderr)
    @input = input
    @stderr = stderr
  end

  def each
    @input.each_line do |line|
      begin
        yield OrderItem.parse(line)
      rescue => e
        @stderr.puts "#{e.class}: #{e.message}"
      end
    end
  end

end
