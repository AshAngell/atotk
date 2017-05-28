module AtoTk
  class Abn
    includes AtoTk::Base
    alias_method :is_valid?, :valid?

    def initialize(val)
      @value = val
      @digits = @value.to_digits if (@value.class == Fixnum || @value.class == Bignum)
    end

    def valid?
      return false if !(@value.class == Fixnum || @value.class == Bignum)
      return false if @digits.size != 11
      @digits[0] -= 1
      @digits.map.with_index {|digit, index| digit * WEIGHTS[@digits.size][index]}.inject {|sum, digit| sum + digit} % 89 == 0
    end

    def to_s
      valid? ? '%s%s %s%s%s %s%s%s %s%s%s' % @digits : ''
    end

  end
end