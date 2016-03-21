require_relative './board'
require_relative './game'

module Interface

  attr_reader :player1, :player2, :board, :symbol
  attr_reader :game_variety, :player

  def self.ask_symbol(player)
    puts "What symbol do you want to use for #{player}?"
    @player = player
    x = gets.chomp
    verify_input(x) 
  end

  def self.verify_input(x)
    if x =~ /\A[a-zA-Z]{1}\z/
      x
    else
      invalid_input
    end
  end

  def self.invalid_input
    raise StandardError.new("The symbol must be one letter character. Please try again.")
    ask_symbol(:player)
  end

  def self.determine_order
    puts "Who would you like to go first? Please press 1 for the #{name(:player1)} and 2 for the #{name(:player2)}."
    get_order
  end

  def self.get_order
    x = order_input
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

  def self.order_input
    gets.chomp
  end


  def self.display_board(x)
    y = "\n#{x.fetch(0)} | #{x.fetch(1)} | #{x.fetch(2)}\n#{x.fetch(3)} | #{x.fetch(4)} | #{x.fetch(5)}\n#{x.fetch(6)} | #{x.fetch(7)} | #{x.fetch(8)}\n"
    y
  end

  def self.name(player) #returning a hash, not a single value
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

  def self.game_variety
    @game_variety
  end

  def self.ask_game_type
    puts "Would you like to have a 1-player game(1), a 2-player game(2), or have 2 computers play each other(3)?"
    answer = gets.chomp
    verify_game_type(answer)
  end

  def self.verify_game_type(answer)
    if answer == "1"
      game_type(1)
    elsif answer == "2"
      game_type(2)   
    elsif answer == "3"
      game_type(3) 
    else
      puts "Invalid answer! Try again."
      ask_game_type
    end
    @game_variety
  end

  def self.ask_space
    puts "What space do you want to pick?"
    #display_board(board)
    answer = gets#.chomp
    answer #gotta make this better
  end

end
