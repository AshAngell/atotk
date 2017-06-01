class Fixnum

  def to_digits
    Math.log10(self).floor.downto(0).map { |i| (self / 10**i) % 10 }
  end

  def abn?
    abn = AtoTk::Abn.new self
    abn.valid?
  end

  def tfn?
    abn = AtoTk::Tfn.new self
    abn.valid?
  end

end