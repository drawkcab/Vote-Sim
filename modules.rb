def stall #Used to stall and clear the screen
  puts `clear`
  sleep(1)
end

def alpha_input(text) # used to retreive clean up and capitalize the string
  puts text
  input = gets.chomp.gsub /\ \d+/, '' #remove all non letters
  input.split.map(&:capitalize).join(' ') #capitalizes multiple words
end


def char_input(text) # used to turn input into a single lowercase letter
  x=0
  until x == 1
  puts text
  input = gets.chomp.gsub(/[^a-zA-Z]/, '').downcase.chr #chomps and drops unexpected chars
    if input == "" || input ==" "
      puts "Invalid entry try again."
    else
      x += 1
    end
  end
  input
end




def main_menu # Main Menu used to route to other methods
selection = "o"
  until selection == "q"
    stall
    case selection = char_input("What would you like to do? (C)reate, (L)ist, (U)pdate, (V)ote, or (Q)uit")
    when "c"
      create
    when "l"
      list
    when "u"
      update
    when "v"
      vote
    when "q"
      break #ends whole app
    else
      puts "Please Enter a valid selection"
    end
  end
end

def create #main for the creat routes all inouts so that
  puts "Choose a selection to create:"
  x = char_input("(V)oter or (P)olitician")
  if x == "v" #voter create
    voter_create
  elsif x == "p"#politician create
    politician_create
  else
    puts "ERROR: This shouldent happen." #Logic error if this happens
  end
end

def voter_create #used to create voters
  x = alpha_input("What is your name?")#allows a string of anything to fill and it will capitalize all first letters
  y = voter_party_choice
    puts "Welcome, #{x} you are now regestered as a #{y} member."
    @voters << Voter.new(x,y)
    puts "Enter any value to return to main menu."
    gets
    main_menu #return to main menu
end

def voter_party_choice #Will not leave the loop until there is a valid selection based on a char input
  valid = 0
  until valid == 1
    puts "What is your party?"
    y = char_input("(T)ea Party, (C)onservative, (N)eutral, (L)iberal, (S)ocialist")
    case y
    when "t"
      y = 'Tea Party'
      valid += 1
    when "c"
      y = "Conservative"
      valid += 1
    when "n"
      y = "Neutral"
      valid += 1
    when "l"
      y = "Liberal"
      valid += 1
    when "s"
      y = "Socialist"
      valid += 1
    else
      puts "Invalid Choice. Try again!"
    end
  end
  return y
end

def politician_create #Used to create politicians
  x = alpha_input("What is your name?")
  y = pol_party_choice
    puts "Welcome, #{x} you are a #{y}. Good luck in the race!"
    @politician << Politician.new(x,y)# adds to politician array
    puts "Enter any value to return to main menu."
    gets
    main_menu
end

def pol_party_choice # pick the political party for the politician create
  valid = 0
  until valid == 1
    puts "What is your party?"
    y = char_input("(D)emocrat or (R)epublican")
    case y
    when "d"
      y = "Democrat"
      valid += 1
    when "r"
      y = "Republican"
      valid += 1
    else
      puts "Invalid Choice. Try again!"
    end
  end
  return y
end

def list #main List module
  puts "VOTERS"
  list_voters
  list_pol
  puts "Enter anything to return to the main menu."
  gets
  main_menu
end

def list_voters #List voter can be refactored with list pol
  puts "VOTERS"
  @voters.each do |voter|
    x = voter.name
    y = voter.party
    printf "%-20s %s\n", x, y
  end
  puts ""
end

def list_pol #List voter can be refactored with list pol
  puts "CANIDATES"
  @politician.each do |pol|
    x = pol.name
    y = pol.party
    printf "%-20s %s\n", x, y
  end
  puts ""
end

def update #main update module routes user to voter update or pol update
    y = char_input("Change a (V)oter name or (P)olitician name.")
    case y
    when "v"
      voter_update
    when "p"
      politician_update
    else
      puts "Invalid Choice. Try again!"
    end
end

def voter_update # updates voter name and party then return to main menu
  list_voters
    choice = alpha_input("What voter are you looking for?")
    @voters.select do |vote| #refector
      if vote.name == choice
        vote.name.delete!(choice)
        names = alpha_input("What would you like to change the name to?")
        vote.name << names
        ## changes party
        z = voter_party_choice
        vote.party.delete!(vote.party)
        vote.party << z
        list_voters
      else
      end
    end
    puts "Enter any value to return to main menu."
    gets
    main_menu
end

def politician_update #Updates politician name then party
  list_pol
  choice = alpha_input("What politician are you looking for?")
  @politician.select do |pol| #refector
    if pol.name == choice
      pol.name.delete!(choice)
      names = alpha_input("What would you like to change the name to?")
      pol.name << names

      z = pol_party_choice
      pol.party.delete!(pol.party)
      pol.party << z
      list_pol
    else
    end
  end
  puts "Enter any value to return to main menu."
  gets
  main_menu
end

def vote #Vote main module. Runs multiple modules to simulate the vote.
  @voters.each do |voter|
    selection(voter.party)
    end

    @politician.each do |pol|
      if pol.party == "Democrat"
        @dem << pol
      else
        @rep << pol
      end
    end

    check_num_pol(@dem)
    check_num_pol(@rep)
    poll_post
    puts""
    puts "Enter any value to return to menu."
    gets
    main_menu
end

def poll_post #Loading screen for voting and then posts results
  8.times do |x|
    print "Running Simulation" + "."*x
    sleep(1)
    puts `clear`
  end

  winner = 0
  name = ""

  @politician.each do |z|
    if z.votes > winner
      winner = z.votes
      name = z.name
    end
  end

  printf "%-20s %-20s %s\n", "Name", "Party", "Votes"
  poll_results(@dem)
  poll_results(@rep)
  puts ""
  puts ""
  puts "The winner is #{name} with #{winner} votes!"
  puts "Congratulations #{name}!"

end

def poll_results(tab) #Used to properly space out poll results
  tab.each do |sel|
    x = sel.name
    y = sel.party
    z = sel.votes
    printf "%-20s %-20s %s\n", x, y, z
  end
end

def check_num_pol(x) #Moves votes to appropriate array
  if x == @dem
    y = @votes[0]
  else
    y = @votes[1]
  end
  z = x.count
  if z > 1
    y.times do
    r = rand(0..z-1)
    x[r].votes +=1
    end
  else
    x[0].votes = y+1
  end

end

def selection(input) # selects a vote based on votng criteria
  x = rand(1..100)
  case input
  when 'Tea Party'
    if x <= 90
      @votes[1]+=1
    else
      @votes[0]+=1
    end
  when "Conservative"
    if x <= 75
      @votes[1]+=1
    else
      @votes[0]+=1
    end
  when "Neutral"
    if x <= 50
      @votes[1]+=1
    else
      @votes[0]+=1
    end
  when "Liberal"
    if x <= 75
      @votes[0]+=1
    else
      @votes[1]+=1
    end
  when "Socialist"
    if x <= 90
      @votes[0]+=1
    else
      @votes[1]+=1
    end
  else
  end
end
