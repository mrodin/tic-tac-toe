require './board.rb'
require './player.rb'

class Game

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

      if (@on_move == @player_x)
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

end

game = Game.new
game.start_game