require_relative 'board'

class Minesweeper


  def initialize(board, player)
    @board = board
    @player = player
  end

  def play
   
    until won?
      @player.get_move
      case @player.move
      when 'r' 
        if @board[@player.coord].bomb
          puts "Game OVERRRRR"
          break
        else
          # reveal positions that are adj and not bombs
        end
      when 'f'
        @board[@player.coord[0]][@player.coord[1]].flag = true
      end
  end


end

# board = Board.new(size, bombs)
# board[0][4].reveal = true
board.reveal([0,3])
# player = Player.new
# game = Minesweeper.new(board, player)
