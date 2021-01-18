module Money
  class Bank
    # @param source
    # @param to [String]
    # @return [Money]
    def reduce(source, to)
      source.reduce(to)
    end
  end
end
