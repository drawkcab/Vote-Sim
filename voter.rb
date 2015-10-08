class Voter < Person

  attr_accessor :party, :votes

  def initialize(name, party)
    super
    @party = party
    
  end

end
