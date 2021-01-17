module Money
  class Money
    include Comparable

    protected attr_reader :amount

    def <=>(other)
      return -1 if self.class != other.class

      amount <=> other.amount
    end
  end
end
