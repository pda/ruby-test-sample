class InvoiceTextFormatter

  def initialize(invoice, output)
    @invoice = invoice
    @output = output
  end

  def output
    @invoice.each do |invoice_item|
      format_invoice_item(invoice_item)
      invoice_item.each_bundle_line do |bundle_line|
        format_bundle_line(bundle_line)
      end
    end
  end

  private

  def format_invoice_item(item)
    @output.puts("%d %s %s" % [item.quantity, item.code, item.price])
  end

  def format_bundle_line(line)
    @output.puts("    %d x %d %s" % [line.quantity, line.bundle.size, line.total_price])
  end

end
