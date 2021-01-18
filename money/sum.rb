module Money
  class Sum
    # @return [Money]
    attr_reader :augend
    # @return [Money]
    attr_reader :addend

    # @param augend [Money]
    # @param addend [Money]
    def initialize(augend, addend)
      @augend = augend
      @addend = addend
    end

    # @param to [String]
    def reduce(to)
      amount = @augend.amount + addend.amount
      Money.new(amount, to)
    end
  end
end
