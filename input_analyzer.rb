def validate
  user_input = gets.chomp.to_i

  if user_input > 10
    puts "The input was greater than 10"
  elsif user_input < 10 && user_input > 0
    puts "The input was less than 10"
  elsif user_input == 0
    puts "The inputs was either 0 or a non-numerical value"
  end
end

puts "Please enter a number greater than 10"

puts validate
