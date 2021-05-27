magic_number = rand 4

puts "Welcome to the guessing number game!\n\n"

puts "Please enter a number between 0 and 3"

user_guess = gets.chomp.to_i

if user_guess > 3
  puts "Your guess is too high!"
elsif user_guess < 0
  puts "Your guess is too low!"
else
  message = "The magic number was #{magic_number}"

  if user_guess == magic_number
    puts "You Guessed Right! #{message}"
  else
    puts "Wrong Try Again!"
    user_guess = gets.chomp.to_i
    if user_guess == magic_number
      puts "You guessed right! #{message}"
    else
      puts "You guessed wrong! #{message}"
    end
  end
end
