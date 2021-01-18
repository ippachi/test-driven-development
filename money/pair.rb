module Money
  class Pair
    # @param from [String]
    # @param to [String]
    def initialize(from, to)
      @from = from
      @to = to
    end

    # @param other [Pair]
    def eql?(other)
      @from == other.from && @to == other.to
    end

    def hash
      0
    end

    protected

    # @return [String]
    attr_reader :from
    # @return [String]
    attr_reader :to
  end
end
