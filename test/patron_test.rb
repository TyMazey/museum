require_relative 'test_helper'

class PatronTest < Minitest::Test

  def test_it_exsist
    patron = Patron.new("Bob", 20)

    assert_instance_of Patron, patron
  end

  def test_it_has_attributes
    patron = Patron.new("Bob", 20)

    assert_equal "Bob", patron.name
    assert_equal 20, patron.spending_money
  end

  def test_it_starts_with_no_interest
    patron = Patron.new("Bob", 20)

    assert_equal [], patron.interest
  end

  def test_it_can_add_interest
    patron = Patron.new("Bob", 20)

    patron.add_interest("Dead Sea Scrolls")
    patron.add_interest("Gems and Minerals")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], patron.interest
  end
end
