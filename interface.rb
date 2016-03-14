require_relative './board'
require_relative './game'

module Interface

  attr_reader :player1, :player2, :board, :symbol
  attr_reader :game_variety

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

  def get_order
    order_input
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

  def order_input
    gets.chomp
  end


  def self.display_board(x)
    y = "\n#{x.fetch(0)} | #{x.fetch(1)} | #{x.fetch(2)}\n#{x.fetch(3)} | #{x.fetch(4)} | #{x.fetch(5)}\n#{x.fetch(6)} | #{x.fetch(7)} | #{x.fetch(8)}\n"
    y
  end

  def self.name(player)
    if @game_variety == SinglePlayer
      {:player1 => "you", :player2 => "the computer"}
    elsif @game_variety == TwoPlayer
      {:player1 => "the first human", :player2 => "the second human"}
    elsif @game_variety == TwoComputer  
      {:player1 => "the first computer", :player2 => "the second computer"} 
    end
  end
  
  def self.game_type(type)
    if type == 1
      @game_variety = SinglePlayer.new
    elsif type == 2
      @game_variety = TwoPlayer.new
    elsif type == 3
      @game_variety = TwoComputer.new
    end
    puts "I've updated game_type!"
  end

  def self.ask_game_type
    puts "Would you like to have a 1-player game(1), a 2-player game(2), or have 2 computers play each other(3)?"
    answer = gets.chomp
    if answer == "Single Player"
      game_type(1)
    elsif answer == "Two Player"
      game_type(2)
    elsif answer == "Two Computer"
      game_type(3)
    end #put in an error if incorrect input
  @game_variety
  end

end
