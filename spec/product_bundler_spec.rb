require "product_bundler"

RSpec.describe ProductBundler do

  def bundler(quantity)
    @bundler ||= ProductBundler.new(product, quantity)
  end

  def bundle_strings(quantity)
    bundler(quantity).each.map do |b|
      "%dx%d" % [b.quantity, b.bundle.size]
    end
  end

  let(:product) do
    instance_double(
      "Product",
      bundles_descending: [
        instance_double("Bundle", code: "CODE", size: 9),
        instance_double("Bundle", code: "CODE", size: 5),
        instance_double("Bundle", code: "CODE", size: 3),
      ]
    )
  end

  it "bundles 9 into 1x9" do
    expect(bundle_strings(9)).to eq(%w{1x9})
  end

  it "bundles 3 into 1x3" do
    expect(bundle_strings(3)).to eq(%w{1x3})
  end

  it "bundles 12 into 1x9 + 1x3" do
    expect(bundle_strings(12)).to eq(%w{1x9 1x3})
  end
 
  it "bundles 13 into 2x5 + 1x3" do
    expect(bundle_strings(13)).to eq(%w{2x5 1x3})
  end

  it "bundles 16 into 2x5 + 2x3" do
    expect(bundle_strings(16)).to eq(%w{2x5 2x3})
  end

end
