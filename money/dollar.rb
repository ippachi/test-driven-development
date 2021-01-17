require_relative './money'

module Money
  class Dollar < Money
    def times(multiplier)
      Money.new(@amount * multiplier, @currency)
    end
  end
end
