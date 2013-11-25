class Tile
  attr_accessor :bomb, :num_adj_bombs, :flag

  def initialize
    @bomb = false
    @num_adj_bombs = 0
    @flag = false
  end

  def set_flag
    @flag = true
  end

end