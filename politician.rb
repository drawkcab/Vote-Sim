class Politician < Person
  attr_accessor :party, :votes

  def initialize(name, party)
    super
    @party = party
    @votes = 1
  end

end
