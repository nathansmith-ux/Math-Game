require './player'
require './questions'

class Game
  def initialize
    @player1 = Player.new("Nate")
    @player2 = Player.new("Alexis")
    @current_player = @player1
  end

  def switch_turn
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def current_score
    puts "#{@player1.lives}/3 vs #{@player2.lives}/3"
  end

  def gameplay
    while @player1.is_alive? && @player2.is_alive?
      question = Question.new
      question.ask_question(@current_player.name)
      print ">"
      answer = gets.chomp.to_i
      if question.correct_answer?(answer)
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        @current_player.lose_life
      end
      current_score
      break unless @current_player.is_alive?
      switch_turn
    end
    winner = @player1.is_alive? ? @player1 : @player2
    puts "#{winner.name} wins with this many lives left #{winner.lives}/3"
    puts "----- GAME OVER -----"
  end
end
