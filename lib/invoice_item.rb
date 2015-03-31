class InvoiceItem

  def initialize(catalog, quantity, code)
    @catalog = catalog
    @quantity = quantity
    @code = code
  end

  attr_reader :code
  attr_reader :quantity

  def each_bundle_line(&block)
    return to_enum(:each_bundle_line) unless block_given?
    bundler.each(&block)
  end

  def price
    each_bundle_line.inject(DollarAmount.zero) do |tally, bundle_line|
      tally += bundle_line.total_price
    end
  end

  private

  def bundler
    ProductBundler.new(product, @quantity)
  end

  def product
    @catalog.find(@code)
  end

end
