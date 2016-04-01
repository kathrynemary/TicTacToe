require_relative '../board'

class DisplayBoardInterface

  def self.display_board(x)
    y = "\n#{x.fetch(0)} | #{x.fetch(1)} | #{x.fetch(2)}\n#{x.fetch(3)} | #{x.fetch(4)} | #{x.fetch(5)}\n#{x.fetch(6)} | #{x.fetch(7)} | #{x.fetch(8)}\n"
    y
  end

  def self.ask_space(board)
    puts "What space do you want to pick?"
    display_board(board)
    answer = gets.chomp
    answer
  end

end
