class Game
  attr_reader :players, :current_player

  def initialize(player_names)
    @players = player_names.map{ |name| Player.new(name) }
    @current_player = @players.first
    @game_over = false
  end
  
  def start_game
    take_turn while !game_over?
    end_game
  end

  def end_game
    winner = players.find do |player|
      player.score != 0 
    end
    puts "#{winner.name} wins with a score of #{winner.score}/#{Player::INITIAL_LIVES}"
    puts "----- GAME OVER -----"
    puts "Goodbye!"
  end


  def display_scores
    scores = players.map do |player|
      "#{player.name}: #{player.score}/#{Player::INITIAL_LIVES}" 
    end
    puts scores.join(' vs ')
  end
  

  def take_turn
    puts "----- NEW TURN -----"
    current_player.take_turn
    display_scores
    switch_turn unless game_over?
  end

  def switch_turn
    player_index = players.index(current_player)
    @current_player = players[(player_index + 1) % players.length()]
  end

  def game_over?
    players.any? do |player|
      player.dead?
    end
  end
end