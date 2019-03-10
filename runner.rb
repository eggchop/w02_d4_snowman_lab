require_relative 'game'
require_relative 'player'
require_relative 'hidden_word'

puts "-" * 26
puts "*** Welcome to Snowman ***"
puts "-" * 26
puts
puts "Enter your name"
print '> '
name = gets.chomp.capitalize
player = Player.new(name, 3)
puts
system 'clear'
puts "Enter secret word"
print '> '
word = gets.chomp
secret_word = HiddenWord.new(word)
puts
system 'clear'
game = Game.new(player,secret_word)

finished = false

while !finished
  if secret_word.word == secret_word.censored_word
    puts "Well done #{name}, you won the game!"
    sleep(3)
    finished = true

  elsif player.player_is_alive? && game.player_has_another_guess?
    puts secret_word.censored_word
    puts "You have #{player.lives} lives and #{6 - game.guessed_letters.count} guesses"
    puts
    puts "Guess a letter"
    print "> "
    letter = gets.chomp
    game.add_letter_to_guessed_letters(letter)
    if secret_word.last_guess_is_in_hidden_word?(game)
      secret_word.update_censored_word_with_correctly_guessed_letter(game)
    else
      player.remove_player_life
    end

  else
    puts "Bad luck #{name}, you lose!"
    sleep(3)
    finished = true
  end
  system 'clear'
  
end
