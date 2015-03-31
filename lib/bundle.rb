class Bundle

  def initialize(code:, size:, price:)
    @code = code
    @size = size
    @price = DollarAmount.cents(price)
  end

  attr_reader :code
  attr_reader :size
  attr_reader :price

end
