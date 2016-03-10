require_relative './board'

module Interface

  attr_reader :player1, :player2, :board

  def self.get_symbol
    x = gets.chomp
    if x =~ /\A[a-zA-Z]{1}\z/
      x
    else
      puts "The symbol must be one letter character. Please try again." #is this loop even working?
      ask_symbol(@player)
    end
  end

  def self.ask_symbol(player)
    @player = player
    puts "What symbol do you want to use for #{player}?"
    get_symbol
  end

  def self.determine_order
    puts "Who would you like to go first? Please press 1 for the #{name(:player1)} and 2 for the #{name(:player2)}."
    get_order
  end

  def self.get_order
    x = gets.chomp
    if x == 1
      :player1
    elsif x == 2
      :player2
    else
      puts "Whoa, wrong answer!"
      determine_order
    end
  end

  def self.display_board(x)
    y = "\n#{x.fetch(0)} | #{x.fetch(1)} | #{x.fetch(2)}\n#{x.fetch(3)} | #{x.fetch(4)} | #{x.fetch(5)}\n#{x.fetch(6)} | #{x.fetch(7)} | #{x.fetch(8)}\n"
    y
  end

  def self.name(player)
    if player == :player1
      "first player"
    elsif player == :player2
      "second player"
    end
  end

end

