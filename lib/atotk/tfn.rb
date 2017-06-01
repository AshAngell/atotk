module AtoTk
  class Tfn
    include AtoTk::Common

    def initialize(val)
      @value = val
      @digits = @value.to_digits if (@value.class == Fixnum || @value.class == Bignum)
    end

    def valid?
      return false if !(@value.class == Fixnum || @value.class == Bignum)
      return false if (@digits.size < 8 || @digits.size > 9)
      @digits.map.with_index {|digit, index| digit * WEIGHTS[@digits.size][index]}.inject {|sum, digit| sum + digit} % 11 == 0
    end

    alias_method :is_valid?, :valid?

    def to_s
      if valid?
        case @digits.size
          when 8
            '%s%s%s %s%s%s %s%s%s' % @digits
          when 9
            '%s%s %s%s%s %s%s%s' % @digits
        end
      else
        ''
      end
    end

  end
end