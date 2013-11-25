require_relative 'tiles'

class Board
  attr_accessor :board, :size, :bombs

  def initialize(size, bombs)
    @board = Array.new(size) { Array.new(size) { Tile.new } }
    possible_pos = []
    size.times do |i|
      size.times do |j|
        possibe_pos << [i, j]
      end
    end
    possible_pos.suffle!
    bombs.times do
      loc = possible_pos.pop
      @board[loc[0]][loc[1]].bomb = true
    end
  end
end