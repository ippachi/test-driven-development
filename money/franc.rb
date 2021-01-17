require_relative './money'

module Money
  class Franc < Money
    def initialize(amount)
      @amount = amount
    end

    def times(multiplier)
      Franc.new(@amount * multiplier)
    end
  end
end
