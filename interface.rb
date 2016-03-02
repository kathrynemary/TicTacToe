require_relative './board'

module Interface

  attr_reader :player1, :player2, :board

  def self.get_symbol
    x = gets.chomp
    if x =~ /\w{1}/
      x
    else
      puts "The symbol must be one letter character. Please try again."
      ask_symbol(@player)
    end
  end

  def self.ask_symbol(player)
    @player = player
    puts "What symbol do you want to use for #{player}?"
    get_symbol
  end

  def self.determine_order
    puts "Who would you like to go first?" #refactor to include correct names?
    get_order
  end

  def self.get_order
    gets.chomp
  end

  def self.display_board(x)
    y = "\n#{x.fetch(0)} | #{x.fetch(1)} | #{x.fetch(2)}\n#{x.fetch(3)} | #{x.fetch(4)} | #{x.fetch(5)}\n#{x.fetch(6)} | #{x.fetch(7)} | #{x.fetch(8)}\n"
    y
  end

end

Interface.ask_symbol("k")
