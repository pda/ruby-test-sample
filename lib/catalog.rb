require "yaml"

class Catalog

  ProductNotFound = Class.new(StandardError)

  def self.load_yaml(file)
    data = YAML.load_file(file)
    products = data.map { |data| Product.new(**data) }
    new(products)
  end

  def initialize(products)
    @products = products
  end

  def find(code)
    none = ->{ raise ProductNotFound, "Product '#{code}' not found" }
    @products.detect(none) { |p| p.code == code }
  end

end
