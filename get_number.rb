# Get My Number Game
# Written by: Smile

puts "Welcome to 'Get My Number!'"
print "what's your name? "
input = gets
name = input.chomp
puts "Welcome, #{name}!"

# Store a random number for the player to guess
puts "I've got a random number between 1 and 100\nCan you guess it?"
target = rand(100)+1 

# track how many guesses the player has made
num_guesses = 0

# track wether the player has guessed correctely
guessed_it = false

until num_guesses == 10 || guessed_it
  
  puts "You've got #{10 - num_guesses} guesses left."
  print "Make a guess: "
  guess = gets.to_i

  num_guesses += 1	

  # compare the guess to the target and print approprieted message
  if guess < target
    puts "Oops. Your guess was LOW"
  elsif guess > target
    puts "Oops. Your guess was HIGH"
  elsif guess == target
    puts "Nice job, #{name}!\nYou guessed the number in #{num_guesses} guesses!"
    guessed_it = true
  else
    puts "Sth went wrong!!!"
  end

end

# if the player ran out of guesses, tell the number
unless guessed_it 
  puts "Sorry, you didn't get the number. It was #{target}."
end





