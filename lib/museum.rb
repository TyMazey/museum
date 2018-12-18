class Museum
  attr_reader :name,
              :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end

  def recommend_exhibits(patron)
    recommendations = @exhibits.find_all do |exhibit|
      patron.interest.include?(exhibit)
    end
    recommendations
  end
end
