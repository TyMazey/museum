class Patron
  attr_accessor :spending_money

  attr_reader :name,
              :interest

  def initialize(name, money)
    @spending_money = money
    @name = name
    @interest = []
  end

  def add_interest(subject)
    @interest.push(subject)
  end
end
