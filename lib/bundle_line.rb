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

end
