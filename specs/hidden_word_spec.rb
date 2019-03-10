require("minitest/autorun")
require("minitest/rg")

require_relative("../game")
require_relative("../player")
require_relative("../hidden_word")


class HiddenWordTest < MiniTest::Test
  def setup
    @player1 = Player.new('Charie', 6)
    @hidden_word = HiddenWord.new('Snowman')
    @new_game = Game.new(@player1,@hidden_word)
    @new_game.guessed_letters = ['y','x','s']
    @new_game.get_letter_from_guesses
  end

  def test_get_hidden_word
    assert_equal('snowman', @hidden_word.word)
  end

  def test_make_censored_word
    assert_equal('*******', @hidden_word.censored_word)
  end

  def test_update_censored_word_with_correctly_guessed_letter
    assert_equal('*******', @hidden_word.censored_word)
    @hidden_word.update_censored_word_with_correctly_guessed_letter(@new_game)
    assert_equal('s******', @hidden_word.censored_word)
  end

  def test_last_guess_is_in_hidden_word
    result = @hidden_word.last_guess_is_in_hidden_word?(@new_game)
    assert_equal(true, result)
  end

end
