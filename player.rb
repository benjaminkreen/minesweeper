class Player
  attr_accessor :input, :coord

  def get_move
    puts "What is your move? (r: reveal, f: flag) "
    @input = gets.chomp
    puts "Enter coordinates: (ie: 0, 0 for top left corner)"
    @coord = gets.chomp.split(", ").map { |coord| coord.to_i }
  end

end