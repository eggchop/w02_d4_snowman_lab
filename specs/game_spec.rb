require("minitest/autorun")
require("minitest/rg")

require_relative("../game")
require_relative("../player")
require_relative("../hidden_word")


class GameTest < MiniTest::Test
  def setup
    @player1 = Player.new('Charie', 6)
    @hidden_word = HiddenWord.new('Snowman')
    @new_game = Game.new(@player1,@hidden_word)
    @guess1 = 'w'
    @new_game.guessed_letters = ['y','x','s']
  end

  def test_add_letter_to_guessed_letters
    result = @new_game.add_letter_to_guessed_letters(@guess1)
    assert_equal(4, @new_game.guessed_letters.count)
  end

  def test_player_has_another_guess__true
    result = @new_game.player_has_another_guess?
    assert_equal(true, result)
  end

  def test_player_has_another_guess__false
    7.times{@new_game.add_letter_to_guessed_letters('w')}
    result = @new_game.player_has_another_guess?
    assert_equal(false, result)
  end

  def test_get_letter_from_guesses
    @new_game.add_letter_to_guessed_letters('w')
    result = @new_game.get_letter_from_guesses
    assert_equal('w', result)
  end

end
