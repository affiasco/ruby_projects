class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = (0...@secret_word.length).map { |i| "_" }
    @attempted_chars = Array.new(0)
    @remaining_incorrect_guesses = 5
  end

  #class methods
  def self.random_word
    DICTIONARY.sample
  end

  #getters 
  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  #instance methods
  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    indices = Array.new(0)
    @secret_word.each_char.with_index { |c, i| indices << i if char == c }
    indices
  end

  def fill_indices(char, array_indices)
    array_indices.each { |idx| @guess_word[idx] = char }
  end

  def try_guess(char)
    self.fill_indices(char, self.get_matching_indices(char))

    @remaining_incorrect_guesses -= 1 if !@secret_word.include?(char)
    
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    else
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    print "Enter a char: "
    user_char = gets.chomp
    self.try_guess(user_char)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN" 
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end
    false
  end

end
