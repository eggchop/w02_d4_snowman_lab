require("minitest/autorun")
require("minitest/rg")

require_relative("../game")
require_relative("../player")
require_relative("../hidden_word")


class PlayerTest < MiniTest::Test
  def setup
    @player1 = Player.new('Charie', 6)
    @player2 = Player.new('Imogen', 3)
    @hidden_word = HiddenWord.new('Snowman')
    @new_game = Game.new(@player1,@hidden_word)
  end

  def test_get_player_name
    assert_equal('Imogen', @player2.name)
  end

  def test_get_player_lives
    assert_equal(6, @player1.lives)
  end

  def test_remove_player_life
    result = @player1.remove_player_life
    assert_equal(5, result)
  end

  def test_player_is_alive?
    result = @player1.player_is_alive?
    assert_equal(true, result)
  end


end
