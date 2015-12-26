require './board.rb'
require './player.rb'

class Game

  WIN_CASES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

  attr_reader :board

  def initialize
    @game_over = false
    @player_x = Player.new('X', 'Player X')
    @player_o = Player.new('O', 'Player O')
    @on_move = @player_x
    @board = Board.new
    @board.draw_board
  end

  def start_game
    while(!@game_over)
      puts "#{@on_move.name}, make your move:"
      coordinates = gets.chomp
      place_symbol(coordinates, @on_move.symbol.to_s)

      @board.draw_board

      if(check_win(@on_move.symbol.to_s))
        puts "#{@on_move.name} wins!"
        @game_over = true
      end

      if @on_move == @player_x
        @on_move = @player_o
      else
        @on_move = @player_x
      end
    end
  end

  def place_symbol(coordinates, symbol)
    @board.place_symbol(get_x(coordinates), get_y(coordinates), symbol)
  end

  private

  # translates coordinates (e.g. a1, b3, etc.) to array position
  def translate_coordinate(coordinate)
    translated = case coordinate
                   when '1' then 2
                   when '2' then 1
                   when '3' then 0
                   when 'a' then 0
                   when 'b' then 1
                   when 'c' then 2
                   else nil
                 end
    translated
  end

  # gets horizontal position in grid
  def get_x(coordinates)
    x = coordinates.downcase[/[a-c]/]
    translate_coordinate(x)
  end

  # gets vertical position in grid
  def get_y(coordinates)
    y = coordinates.downcase[/[1-3]/]
    translate_coordinate(y)
  end

  def check_win(symbol)
    WIN_CASES.each do |i|
      diff = i - scan_symbol_positions(symbol)
      return true if diff.empty?
    end
    false
  end

  def scan_symbol_positions(symbol)
    positions = []
    @board.grid.each do |i|
      i.each do |cell|
        if cell.symbol == symbol
          positions << cell.position
        end
      end
    end
    positions
  end

end

game = Game.new
game.start_game
