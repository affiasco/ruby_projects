class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def initialize(array_chars)
    if Code.valid_pegs?(array_chars)
      @pegs = array_chars.map(&:upcase)
    else
      raise "Provided chars are not valid pegs"
    end
  end

  #class methods
  def self.valid_pegs?(array_chars)
    array_chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    random_pegs = Array.new(0)
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  #instance methods
  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      count +=1 if guess[i] == self[i]
    end
    count
  end
  
  def num_near_matches(guess_code)
    count = 0
    (0...guess_code.length).each do |i|
      if guess_code[i] != self[i] && self.pegs.include?(guess_code[i])
        count += 1
      end
    end
    count 
  end 

  def ==(other_code_instance)
    return false if other_code_instance.length != self.length
    other_code_instance.pegs == self.pegs
  end
end
