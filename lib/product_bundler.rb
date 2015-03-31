require "bundle_line"

class ProductBundler

  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end

  def each
    return to_enum(:each) unless block_given?
    bundle_lines.each { |bundle_line| yield bundle_line }
  end

  private

  def bundle_lines
    try_bundles(@product.bundles_descending)
  end

  def try_bundles(bundles)
    raise Error, error_message if bundles.empty?
    attempt(bundles) || try_bundles(bundles.dup.tap(&:shift))
  end

  def error_message
    "cannot map quantity %d to bundles of size %s" % [
      @quantity,
      @product.bundles_descending.map(&:size).join(", ")
    ]
  end

  def attempt(bundles)
    Attempt.new(bundles, @quantity).call
  end

  Error = Class.new(StandardError)

  class Attempt

    def initialize(bundles, remaining)
      @bundles = bundles.dup
      @remaining = remaining
      @results = []
    end

    def call
      step until done?
      if @remaining == 0
        @results
      else
        false
      end
    end

    private

    def step
      if any?
        @results << result
        @remaining -= result.total_quantity
      end
      @bundles = tail
    end

    def result
      BundleLine.new(bundle: bundle, quantity: quantity)
    end

    def any?
      quantity > 0
    end

    def done?
      @remaining == 0 || @bundles.empty?
    end

    def bundle
      @bundles.first
    end

    def tail
      @bundles.dup.tap(&:shift)
    end

    def quantity
      @remaining / bundle.size
    end

  end

end
