class Product

  def initialize(name:, code:, bundles:)
    @name = name
    @code = code
    @bundles = bundles
  end

  attr_reader :code
  attr_reader :name

  def bundles_descending
    bundles.sort { |a, b| b.size <=> a.size }
  end

  private

  def bundles
    bundles = @bundles.map { |data| Bundle.new(code: code, **data) }
  end

end
