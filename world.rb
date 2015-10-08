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


  @voters << Voter.new("Matt","Socialist")
  @voters << Voter.new("Tim","Socialist")
  @voters << Voter.new("Jim","Socialist")
  @voters << Voter.new("Wayne","Socialist")

  @politician << Politician.new("Matthew Roche", "Democrat")
  @politician << Politician.new("Rando", "Democrat")
  @politician << Politician.new("Mark Roche", "Republican")
  @politician << Politician.new("Mark", "Republican")


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
