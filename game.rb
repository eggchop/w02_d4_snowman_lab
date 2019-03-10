class Game
  attr_accessor :guessed_letters, :hidden_word, :guessed_letters
  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []
  end

  def add_letter_to_guessed_letters(letter)
    @guessed_letters << letter
  end

  def player_has_another_guess?
    return @guessed_letters.count <= 6
  end

  def get_letter_from_guesses
    return @guessed_letters.last
  end


end
