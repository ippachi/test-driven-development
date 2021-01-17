require 'test-unit'
require_relative '../money/dollar'
require_relative '../money/franc'

module Money
  class MoneyTest < Test::Unit::TestCase
    def test_multiplication
      five = Money.dollar(5)
      assert_equal(Money.dollar(10), five.times(2))
      assert_equal(Money.dollar(15), five.times(3))
    end

    def test_equality
      assert_true(Money.dollar(5) == Money.dollar(5))
      assert_false(Money.dollar(5) == Money.dollar(6))
      assert_true(Money.franc(5) == Money.franc(5))
      assert_false(Money.franc(5) == Money.franc(6))
      assert_false(Money.franc(5) == Money.dollar(5))
    end

    def test_franc__multiplication
      five = Money.franc(5)
      assert_equal(Money.franc(10), five.times(2))
      assert_equal(Money.franc(15), five.times(3))
    end
  end
end
