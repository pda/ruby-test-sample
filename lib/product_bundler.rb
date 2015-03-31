class ProductBundler

  def initialize(catalog, code, quantity)
    @catalog = catalog
    @code = code
    @quantity = quantity
  end

  def each
    remainder = @quantity
    product.bundles_descending.each do |bundle|
      quotient = remainder / bundle.size
      remainder = remainder % bundle.size
      if quotient > 0
        yield BundleLine.new(quantity: quotient, bundle: bundle)
      end
    end
  end

  private

  def product
    @catalog.find(@code)
  end

end
