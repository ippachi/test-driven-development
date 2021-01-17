module Money
  class Money
    include Comparable

    protected attr_reader :amount

    def self.dollar(amount)
      Dollar.new(amount)
    end

    def self.franc(amount)
      Franc.new(amount)
    end

    def <=>(other)
      return -1 if self.class != other.class

      amount <=> other.amount
    end
  end
end
