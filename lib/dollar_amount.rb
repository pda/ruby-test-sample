class DollarAmount

  private_class_method :new

  def self.zero
    new(0)
  end

  def self.cents(cents)
    new(cents)
  end

  def initialize(cents)
    @cents = cents
  end

  def +(other)
    self.class.cents(to_i + other.to_i)
  end

  def *(other)
    self.class.cents(to_i * other.to_i)
  end

  def to_i
    @cents
  end

  def to_s
    "$%d.%02d" % [@cents / 100, @cents % 100]
  end

end
