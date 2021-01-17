module Money
  class Money
    include Comparable

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
      Money.new(@amount + other.amount, @currency)
    end

    # @param multiplier [Integer]
    def times(multiplier)
      Money.new(@amount * multiplier, @currency)
    end

    protected

    attr_reader :amount
  end
end
