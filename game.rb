require './board.rb'
require './player.rb'

class Game

  @game_over = false
  @players = []

  def initialize
    @players << Player.new('X', 'Player1')
    @players << Player.new('O', 'Player2')
    @board = Board.new
    @board.draw_board
  end

  def start_game
    while(!@game_over)
      puts 'Make your move:'
      coordinates = gets.chomp
      place_symbol(coordinates, 'X')
    end
  end

  def place_symbol(coordinates, symbol)
    @board.place_symbol(get_x(coordinates), get_y(coordinates), symbol)
    @board.draw_board
  end

  private

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

  def get_x(coordinates)
    x = coordinates.downcase[/[a-c]/]
    translate_coordinate(x)
  end

  def get_y(coordinates)
    y = coordinates.downcase[/[1-3]/]
    translate_coordinate(y)
  end

end

game = Game.new
game.start_game