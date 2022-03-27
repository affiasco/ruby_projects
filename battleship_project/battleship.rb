require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  def initialize(board_length)
    @board_length = board_length
    @player = Player.new
    Board.new(board_length)
    @board = Board.new(board_length * board_length)
    @remaining_misses = (board_length * board_length) / 2
  end

  def start_game
    @board.place_random_ships
    print @board.num_ships
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      print "you lose"
      return true
    end
    false
  end

  def win?
    if @board.num_ships == 0
      print "you win"
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose?
      return true
    else
      return false
    end
  end

  def turn
    @remaining_misses -= 1 if !@board.attack(@player.get_move)
    @board.print
    print @remaining_misses
  end
end
