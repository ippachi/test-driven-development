module Money
  class Money
    include Comparable

    protected

    attr_reader :amount

    class << self
      def dollar(amount)
        Dollar.new(amount)
      end

      def franc(amount)
        Franc.new(amount)
      end
    end

    def <=>(other)
      return nil if self.class != other.class

      amount <=> other.amount
    end
  end
end
