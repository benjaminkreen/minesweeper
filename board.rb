require '/Users/appacademy/Desktop/w2d1/minesweeper/tile.rb'

class Board
  attr_accessor :board, :size, :bombs

  def initialize(size, bombs)
    @board = Array.new(size) { Array.new(size) { Tile.new } }
    @size = size
    possible_pos = []
    size.times do |i|
      size.times do |j|
        possible_pos << [i, j]
      end
    end
    possible_pos.shuffle!
    bombs.times do
      loc = possible_pos.pop
      @board[loc[0]][loc[1]].bomb = true
    end

    neighboring_bomb_count(@board)

  end

  NEIGHBORS = [
    [-1, 1],
    [-1, 0],
    [-1, -1],
    [0, 1],
    [0, -1],
    [1, 1],
    [1, 0],
    [1, -1]
  ]

  def valid_pos?(pos)
    pos >= 0 && pos <= (@size - 1)
  end

  def neighboring_bomb_count(board)
    board.each_with_index do |row, i|
      row.each_with_index do |tile, j|
        NEIGHBORS.each do |neighbor|
          x, y = (i + neighbor[0]), (j + neighbor[1])
          if valid_pos?(x) && valid_pos?(y)
            tile.num_adj_bombs += 1 if @board[x][y].bomb
          end
        end
      end
    end
  end


  def reveal(coord)
    @board[coord[0]][coord[1]].reveal = true
    sorted = false
    until sorted
      sorted = true
    NEIGHBORS.each do |neighbor|
      x, y = (coord[0] + neighbor[0]), (coord[1] + neighbor[1])
      if valid_pos?(x) && valid_pos?(y)
        @board[x][y].reveal = true
        sorted = false
      end
        # reveal([x, y]) if @board[x][y].num_adj_bombs == 0
        # return
      end
    end
  end



  def print_board
    @board.each do |row|
      p row.map {|x| [x.num_adj_bombs, "bomb #{x.bomb}", x.reveal] }
    end
  end

end

board = Board.new(5, 3)
board.reveal([0,0])
board.print_board