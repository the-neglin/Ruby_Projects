require 'csv'

def validate(name, age)
  valid_name = false
  valid_age = false
  if name.length < 1
    puts "You did not enter a valid name. Goodbye"
  else
    valid_name = true
  end
  if age > 0
    valid_age = true
  else
    puts "The age was not valid. Goodbye"
  end
  if valid_age && valid_name == true
     return true
  end
end

puts "Please enter the student name: "
name = gets.chomp
puts "Please enter the student age: "
age = gets.chomp.to_i

if validate(name, age) == true

  string = [name + ',' + age.to_s]

end

CSV.open('students.csv', 'a') do |csv|
  csv << string
end

puts "Thank you! The record has been added to our file"
