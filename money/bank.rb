require_relative './pair'

module Money
  class Bank
    def initialize
      # @type [Hash{Pair=>Integer}]
      @rates = {}
    end

    def reduce(source, to)
      source.reduce(self, to)
    end

    def add_rate(from, to, rate)
      @rates[Pair.new(from, to)] = rate
      @rates
    end

    def rate(from, to)
      return 1 if from == to

      @rates[Pair.new(from, to)]
    end
  end
end
