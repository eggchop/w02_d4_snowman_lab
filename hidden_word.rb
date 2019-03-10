class HiddenWord
  attr_reader :word, :censored_word
  def initialize(word)
      @word = word.downcase
      hide_word
  end

  def hide_word
    @censored_word = word.gsub(/[a-z]/, '*')
  end

  def last_guess_is_in_hidden_word?(game)
    @word.include?(game.get_letter_from_guesses)
  end

  def update_censored_word_with_correctly_guessed_letter(game)
    @word.split('').each_with_index do |letter, index|
      if letter == (game.get_letter_from_guesses)
        @censored_word[index] = letter
      end
    end
  end


end
