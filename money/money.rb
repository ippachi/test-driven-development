module Money
  class Money
    include Comparable

    attr_reader :currency

    class << self
      def dollar(amount)
        Money.new(amount, 'USD')
      end

      def franc(amount)
        Money.new(amount, 'CHF')
      end
    end

    def initialize(amount, currency)
      @amount = amount
      @currency = currency
    end

    def <=>(other)
      return nil if self.currency != other.currency

      amount <=> other.amount
    end

    def times(multiplier)
      Money.new(@amount * multiplier, @currency)
    end

    protected

    attr_reader :amount
  end
end
