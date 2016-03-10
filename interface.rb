require_relative './board'
require_relative './game'

module Interface

  attr_reader :player1, :player2, :board, :symbol

  def self.ask_symbol(player)
    @player = player
    puts "What symbol do you want to use for #{player}?"
    @symbol = get_symbol
  end

  def self.get_symbol
    x = gets.chomp
    if x =~ /\A[a-zA-Z]{1}\z/
      x
 #   else
 #     puts "The symbol must be one letter character. Please try again." #is this loop even working?
#      ask_symbol(@player)
    end
  end

  def self.determine_order
    puts "Who would you like to go first? Please press 1 for the #{name(:player1)} and 2 for the #{name(:player2)}."
    get_order
  end

  def self.get_order
    x = gets.chomp
    if x == 1
      puts "you chose player 1!"
      :player1
    elsif x == 2
      puts "you chose player 2!"
      :player2
    else #idk if this works
      puts "Whoa, wrong answer!"
      determine_order
    end
  end

  def self.display_board(x)
    x.each do |key|
      if x[key].instance_of? Player
        puts "replacing #{x[key]} with the player's symbol."
        x[key] = key.symbol
      end
    end
    y = "\n#{x.fetch(0)} | #{x.fetch(1)} | #{x.fetch(2)}\n#{x.fetch(3)} | #{x.fetch(4)} | #{x.fetch(5)}\n#{x.fetch(6)} | #{x.fetch(7)} | #{x.fetch(8)}\n"
    y
  end

  def name(player)
    if SinglePlayer
      if player == :player1
        "you"
      elsif player == :player2
        "the computer"
      end
    elsif TwoPlayer
      if player == :player1
        "first human"
      elsif player == :player2
        "second human"
      end 
    elsif TwoComputer   
      if player == :player1
        "the first computer"
      elsif player == :player2
        "the second computer"
      end
    end

  end
  
  def self.ask_game_type
    puts "Would you like to have a 1-player game, a 2-player game, or have 2 computers play each other?"
    answer = gets.chomp
    if answer == "Single Player"
      SinglePlayer.new
    elsif answer == "Two Player"
      TwoPlayer.new
    elsif answer == "Two Computer"
      TwoComputer.new
    end #put in an error if incorrect input
  end

end

