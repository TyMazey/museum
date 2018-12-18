class Museum
  attr_reader :name,
              :exhibits,
              :patrons,
              :revenue

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @revenue = 0
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
    recommended = recommend_exhibits(patron)
    exhibit_list = recommended.sort_by do |exhibit|
      exhibit.cost
    end
    exhibit_list.reverse.each do |exhibit|
      if patron.spending_money >= exhibit.cost
      #  binding.pry
          patron.spending_money -= exhibit.cost
        @revenue += exhibit.cost
      end
    end
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
