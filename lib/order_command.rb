class OrderCommand

  def initialize(argv:, stdin:, stdout:, stderr:)
    @argv = argv
    @stdin = stdin
    @stdout = stdout
    @stderr = stderr
  end

  def call
    InvoiceTextFormatter.new(invoice, @stdout).output
  end

  private

  def invoice
    Invoice.new(catalog, order)
  end

  def order
    StreamingOrder.new(@stdin)
  end

  def catalog
    Catalog.load_yaml("products.yml")
  end

end
