class Invoice

  def initialize(catalog, order)
    @catalog = catalog
    @order = order
  end

  def each
    @order.each do |item|
      yield InvoiceItem.new(@catalog, item.quantity, item.code)
    end
  end

end
