class Patron

  attr_reader :name,
              :spending_money,
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
