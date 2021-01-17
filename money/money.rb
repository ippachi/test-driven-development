module Money
  class Money
    include Comparable

    attr_reader :currency

    class << self
      def dollar(amount)
        Dollar.new(amount, 'USD')
      end

      def franc(amount)
        Franc.new(amount, 'CHF')
      end
    end

    def initialize(amount, currency)
      @amount = amount
      @currency = currency
    end

    def <=>(other)
      return nil if self.class != other.class

      amount <=> other.amount
    end

    protected

    attr_reader :amount
  end
end
