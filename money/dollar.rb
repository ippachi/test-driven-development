require_relative './money'

module Money
  class Dollar < Money
    def times(multiplier)
      Money.dollar(@amount * multiplier)
    end
  end
end
