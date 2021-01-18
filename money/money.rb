require_relative './sum'

module Money
  class Money
    include Comparable

    # @return [Integer]
    attr_reader :amount
    # @return [String]
    attr_reader :currency

    class << self
      # @param amount [Integer]
      def dollar(amount)
        Money.new(amount, 'USD')
      end

      # @param amount [Integer]
      def franc(amount)
        Money.new(amount, 'CHF')
      end
    end

    # @param amount [Integer]
    # @param currency [String]
    def initialize(amount, currency)
      @amount = amount
      @currency = currency
    end

    # @param other [self]
    def <=>(other)
      return nil if currency != other.currency

      amount <=> other.amount
    end

    # @param other [self]
    def plus(other)
      Sum.new(self, other)
    end

    # @param multiplier [Integer]
    def times(multiplier)
      Money.new(@amount * multiplier, @currency)
    end

    # @param bank [Bank]
    # @param to [String]
    def reduce(bank, to)
      rate = bank.rate(@currency, to)
      Money.new(@amount / rate, to)
    end
  end
end
