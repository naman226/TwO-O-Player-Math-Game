

class Game 

  def initialize
    puts "Welcome to the game. Lets get started"

    puts "Player 1 choose your name"
    print "> "

    @name_first = gets.chomp
    @player1 = Players.new(@name_first)

    puts "Player 2 choose your name"
    print "> "

    @name_second = gets.chomp
    @player2 = Players.new(@name_second)

    @current_player = @player1
  end

  def turn
    puts "#{@current_player.name}: Its your turn"

    @question = Question.new
    puts @question.problem
    print "> "

    @answer = gets.chomp.to_i 

    self.answer_checker(@current_player)

    if @current_player == @player1
        @current_player = @player2
    else 
        @current_player = @player1
    end
  end

  def answer_checker(current_player)
    p @question.is_correct(@answer), 'this'
    if @question.is_correct(@answer)
      puts "YES! You are correct" 
    else
      puts "Seriously? No"
      current_player.kill_a_life
    end
    puts "#{@player1.lives}/3 VS #{@player2.lives}/3"
  end


  def keep_playing
    while @player1.lives > 0 && @player2.lives > 0
      self.turn
    end
    p "#{@current_player.name} wins with a score of #{@current_player.lives}/3!"
    p "-------GAME OVER-------"
  end

end
