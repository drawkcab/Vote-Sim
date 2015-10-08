class Person

  attr_accessor :name
  #attr_reader :id
  #@@next_id = 1

  def initialize (name, party)
    @name = name
    #@id = @@next_id
    #@@next_id += 1
  end

end
