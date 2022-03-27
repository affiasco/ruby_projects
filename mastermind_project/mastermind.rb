require_relative "code"

class Mastermind

  def initialize(num)
    @secret_code = Code.random(num)
  end

  #instance methods

  def print_matches(code_instance)
    p @secret_code.num_exact_matches(code_instance)
    p @secret_code.num_near_matches(code_instance)
  end

  def ask_user_for_guess
    puts "Enter a code"
    guess = Code.from_string(gets.chomp)
    self.print_matches(guess)
    @secret_code == guess
  end
end
  