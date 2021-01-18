require_relative './pair'
module Money
  class Bank
    def initialize
      # @type [Hash{Pair=>Integer}]
      @rates = {}
    end
    # @param source
    # @param to [String]
    # @return [Money]
    def reduce(source, to)
      source.reduce(self, to)
    end

    # @param from [String]
    # @param to [String]
    # @param rate [Integer]
    def add_rate(from, to, rate)
      @rates[Pair.new(from, to)] = rate
    end

    # @param from [String]
    # @param to [String]
    def rate(from, to)
      return 1 if from == to

      @rates[Pair.new(from, to)]
    end
  end
end
