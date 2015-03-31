class OrderItem

  PATTERN = %r{\A([0-9]+)\s+(\S+)\s*\z}

  def self.parse(line)
    if match = PATTERN.match(line)
      new(quantity: Integer(match[1]), code: match[2])
    else
      raise ParseError, "Malformed input: '#{line.chop}'"
    end
  end

  class ParseError < StandardError; end

  def initialize(quantity:, code:)
    @quantity = quantity
    @code = code
  end

  attr_reader :code
  attr_reader :quantity

end
