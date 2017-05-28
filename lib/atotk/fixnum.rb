class Fixnum

  def to_digits
    Math.log10(self).floor.downto(0).map { |i| (self / 10**i) % 10 }
  end

end