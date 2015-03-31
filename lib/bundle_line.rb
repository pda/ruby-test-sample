class BundleLine

  def initialize(quantity:, bundle:)
    @quantity = quantity
    @bundle = bundle
  end

  attr_reader :quantity
  attr_reader :bundle

  def total_price
    bundle.price * @quantity
  end

  def total_quantity
    bundle.size * @quantity
  end

  def inspect
    "#<%s %dx%d %s>" % [self.class, quantity, bundle.size, bundle.code]
  end

end
