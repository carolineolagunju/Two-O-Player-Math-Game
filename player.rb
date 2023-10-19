class Player
  attr_reader :name, :score

  INITIAL_LIVES = 3

  def initialize(name)
    @name = name
    @score = INITIAL_LIVES
  end
  
  def take_turn
    question = Question.new
    puts "#{name}: #{question}"
    answer = gets.chomp.to_i

    question.correct?(answer) ? puts("#{name}: YES! You are correct!") : (puts "#{name}: Seriously? No!"; lose_life)
  end
  
  def lose_life
    @score -= 1
  end
  
  def dead?
    score.zero?
  end
end    