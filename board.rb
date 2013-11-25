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
    possible_pos.shuffle!
    bombs.times do
      loc = possible_pos.pop
      @board[loc[0]][loc[1]].bomb = true
    end

    @board = assign_values(@board)

  end

  def assign_values(board)
    NEIGHBORS = [
      [-1, 1],
      [-1, 0],
      [-1, -1],
      [0, 1],
      [0, -1],
      [1, 1],
      [1, 0],
      [1, -1],
    ]

    board.each_with_index do |row, i|
      row.each_with_index do |tile, j|
        NEIGHBORS.each do |neighbor|
          next if board[i+neighbor.first][j+neighbor.last].nil?
          tile.value += 1 if board[i+neighbor.first][j+neighbor.last].bomb
        end
      end
    end
  end

end