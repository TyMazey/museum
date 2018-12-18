class Museum
  attr_reader :name,
              :exhibits,
              :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits.push(exhibit)
  end

  def recommend_exhibits(patron)
    recommendations = []
    @exhibits.each do |exhibit|
      if patron.interest.include?(exhibit.name)
        recommendations.push(exhibit)
      end
    end
    recommendations
  end

  def admit(patron)
    @patrons.push(patron)
  end

  def patrons_by_exhibit_interest
    group = {}
    @exhibits.each do |exhibit|
      patrons = @patrons.find_all do |patron|
        patron.interest.include?(exhibit.name)
      end
      group[exhibit] = patrons
    end
    group
  end
end
