class Question
  attr_reader :num1, :num2, :answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = num1 + num2
  end
  
  def to_s
    "What does #{num1} plus #{num2} equal?"
  end
  
  def correct?(player_answer)
    player_answer == answer
  end
end