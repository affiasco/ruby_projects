class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  #class methods

  def self.print_grid(grid)
    grid.each do |row|
        print row.join(" ") + "\n"
    end
  end

  #instance methods

  def [](indicies)
    @grid[indicies[0]][indicies[1]]
    
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    count = 0
    @grid.each do |row|
      row.each do |ele|
        count +=1 if ele == :S        
      end
    end
    count  
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battle ship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    total_ships = @size * 0.25

    while self.num_ships < total_ships
      rand_row = rand(0...@grid.length)
      rand_col = rand(0...@grid.length)
      pos = [rand_row, rand_col]
      self[pos] = :S
    end
  end

  def hidden_ships_grid

    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          :N
        else
          ele
        end 
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end