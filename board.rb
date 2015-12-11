require './cell.rb'

class Board

  def initialize
    @grid = create_board
  end

  def draw_board
    puts '-+-------+'
    puts "3| #{@grid[0][0].symbol} #{@grid[0][1].symbol} #{@grid[0][2].symbol} |"
    puts "2| #{@grid[1][0].symbol} #{@grid[1][1].symbol} #{@grid[1][2].symbol} |"
    puts "1| #{@grid[2][0].symbol} #{@grid[2][1].symbol} #{@grid[2][2].symbol} |"
    puts '-+-------+'
    puts '---a b c'
  end

  def place_symbol(x, y, symbol)
    @grid[y][x] = Cell.new(symbol)
  end

  private

  def create_board
    Array.new(3) { Array.new(3, Cell.new) }
  end
end

# board = Board.new
# board.draw_board
# board.place_symbol(0, 0, 'X')
# board.draw_board