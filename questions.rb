class Question
  def initialize
    @num1 = rand(0...20)
    @num2 = rand(0...20)
    @answer = @num1 + @num2
  end

  def ask_question(name)
    puts "#{name}, what is #{@num1} + #{@num2} equal to?"
  end

  def correct_answer?(input)
    input == @answer 
  end
end
