class Cell
  attr_reader :position
  attr_accessor :symbol

  def initialize(position, symbol = '.')
    @position = position
    @symbol = symbol
  end
end