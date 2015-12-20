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

  # def draw_position
  #   puts '-+-------+'
  #   puts "3| #{@grid[0][0].position} #{@grid[0][1].position} #{@grid[0][2].position} |"
  #   puts "2| #{@grid[1][0].position} #{@grid[1][1].position} #{@grid[1][2].position} |"
  #   puts "1| #{@grid[2][0].position} #{@grid[2][1].position} #{@grid[2][2].position} |"
  #   puts '-+-------+'
  #   puts '---a b c'
  # end

  def place_symbol(x, y, symbol)
    @grid[y][x].symbol = symbol
  end

  private

  def create_board
    position = 0
    grid = Array.new(3) { Array.new(3) }
    grid.each do |i|
      i.map! do |element|
        position += 1
        element = Cell.new(position)
      end
    end
    grid
  end

end