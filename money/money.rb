require_relative './sum'

module Money
  class Money
    include Comparable

    attr_reader :amount, :currency

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
      return nil if currency != other.currency

      amount <=> other.amount
    end

    def plus(other)
      # @type [#reduce]
      Sum.new(self, other)
    end

    def times(multiplier)
      Money.new(@amount * multiplier, @currency)
    end

    def reduce(bank, to)
      rate = bank.rate(@currency, to)
      Money.new(@amount / rate, to)
    end
  end
end
