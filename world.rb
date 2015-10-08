require './modules.rb'
require './person.rb'
require './voter.rb'
require './politician.rb'

 #class World
  @voters = []
  @politician = []
  @dem = []
  @rep = []
  @votes = [0,0] #0 = Dem 1 = Rep


  @voters << Voter.new("Matt","Neutral")
  @voters << Voter.new("Tim","Liberal")
  @voters << Voter.new("Jim","Socialist")
  @voters << Voter.new("Wayne","Socialist")
  @voters << Voter.new("Joe","Tea Party")
  @voters << Voter.new("Juan","Tea Party")
  @voters << Voter.new("Henry","Neutral")
  @voters << Voter.new("Lopez","Socialist")
  @voters << Voter.new("David","Socialist")
  @voters << Voter.new("Chris","Liberal")
  @voters << Voter.new("Jenny","Socialist")
  @voters << Voter.new("Lisa","Socialist")
  @voters << Voter.new("Anne","Tea Party")
  @voters << Voter.new("Elizabeth","Tea Party")
  @voters << Voter.new("Phyllis","Neutral")
  @voters << Voter.new("Holly","Conservative")
  @voters << Voter.new("Jen","Neutral")
  @voters << Voter.new("Juan","Liberal")
  @voters << Voter.new("James","Socialist")
  @voters << Voter.new("Christine","Socialist")
  @voters << Voter.new("Mark","Tea Party")
  @voters << Voter.new("Nate","Tea Party")
  @voters << Voter.new("Natalie","Neutral")
  @voters << Voter.new("Conner","Conservative")

  @politician << Politician.new("Hillary Clinton", "Democrat")
  @politician << Politician.new("Elizabeth Paine", "Democrat")
  @politician << Politician.new("Marco Rubio", "Republican")
  @politician << Politician.new("Jeb Bush", "Republican")


  #main_menu

  # p @voters
  #
   #vote
  #
  # p @votes
  # p @politician
  # # count_party


   main_menu


  # puts c.name
  # puts c.party
  # puts c.id

  # d = Politician.new
  #
  # puts d.name
  # puts d.party
  # puts d.id
  # puts Person.preview_next_id
 #end
