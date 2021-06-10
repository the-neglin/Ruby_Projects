credentials = []

not_exit = true

def validate (site, user, pass)
  if site == ""
    puts "You did not enter a valid website!"
  else
    if user == ""
      puts "You did not enter a valid username!"
    else
      if pass == ""
        puts "You did not enter a valid password!"
      end
    end
  end
end

while not_exit do
  puts "Please enter a website name: \n"
  site = gets.chomp
  if (site == 'exit')
    puts "You chose to exit the program. Goodbye!"
    not_exit = false
  else
    puts "Please enter a username: \n"
    user = gets.chomp
    if (user == 'exit')
      puts "You chose to exit the program. Goodbye!"
      not_exit = false
    else
      puts "Please enter a password: \n"
      pass = gets.chomp
      if (pass == 'exit')
        puts "You chose to exit the program. Goodbye!"
        not_exit = false
      end
    end
    validate(site, user, pass)
    credentials.push({website: site, username: user, password: pass})
  end
  puts "Thank you!"
end

puts "Your list of credentials is: #{credentials}"
