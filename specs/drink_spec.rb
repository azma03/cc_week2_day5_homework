require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < Minitest::Test

  def setup
      @drink1 = Drink.new("drink1", 4.0)
  end

  def test_can_get_drink_name
    assert_equal("drink1", @drink1.name)
  end

  def test_can_get_drink_price
    assert_equal(4.0, @drink1.price)
  end

end
