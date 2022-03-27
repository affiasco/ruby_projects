class Room
  def initialize(capacity)
    @capacity = capacity
    @occupants = Array.new(0)
  end

  #getters
  def capacity
    @capacity
  end

  def occupants
    @occupants
  end

  #instance methods
  def full?
    return false if @capacity > @occupants.length
    true
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(person)
    if !self.full?
      @occupants << person
      return true
    end
    false
  end
end