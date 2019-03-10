class Player
  attr_reader :name, :lives
  def initialize(name,lives)
    @name = name
    @lives = lives
  end

  def remove_player_life
    @lives -= 1
  end

  def player_is_alive?
    @lives > 0
  end


end
