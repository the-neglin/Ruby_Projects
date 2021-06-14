require 'csv'

class Student
  attr_accessor :first_name, :last_name, :student_id
  attr_reader :filename

  def initialize(first_name, last_name, student_id = rand(1000..9999))
    @first_name = first_name
    @last_name = last_name
    @student_id = student_id
    @filename = "#{student_id}-file.csv"
  end

  def self.filename(student_id)
    "#{student_id}-file.csv"
  end

  def valid?
    if (!first_name.nil? && first_name.length > 0) &&
       (!last_name.nil? && last_name.length > 0)
        return true
    else
      print "Student attributes not valid. "
      return false
    end
  end

  def create
    if !File.exist?(filename)
      save
    else
      puts "Cannot create file. File #{filename} already exists for #{student_id}."
      return false
    end
  end

  def update
    if File.exist?(filename)
      save
    else
      puts "File does not exist, update cannot be performed.\n\n"
      return false
    end
  end

  def self.delete(student_id)
    filename = Student.filename student_id
    if File.exist?(filename)
      File.delete(filename)
      puts "The file #{filename} was deleted!"
      return true
    else
      puts "File does not exist."
      return false
    end
  end

  def self.read(student_id)
    filename = Student.filename student_id
    if File.exist?(filename)
      File.open(filename, 'r') do |file|
        record = CSV.parse(file.read)[0]
        return Student.new(record[0], record[1], student_id)
      end
    else
      puts "Student record does not exist."
    end
  end

  def save
    unless valid?
      puts "Cannot save file."
    end
    save_file = CSV.open(filename, "w") do |csv|
      csv << [first_name, last_name]
    end
    puts "File #{filename} saved for student #{first_name} #{last_name} with ID: #{student_id}.\n\n"
    return !save_file.nil?
  end
end

puts "Welcome to the student registration system!\n\n"
puts "-------------------------------------------------------------"
puts "-------------------------------------------------------------\n\n"

not_exit = true

while not_exit do
  puts "Your menu options are:\n\n"

  puts "Enter create to create a new student registation."
  puts "Enter update to update a student's registation."
  puts "Enter delete to delete a student's registation."
  puts "Enter exit to exit the student registation."

  menu_choice = gets.chomp.downcase
  student = Student.new(first_name = "", last_name = "")


  if menu_choice == "create"
    puts "Please enter the student's first name: "
    first_name = gets.chomp
    puts "Please enter the student's last name: "
    last_name = gets.chomp
    student.create
    student = Student.read student.student_id
  elsif menu_choice == "update"
    puts "Please choose a Student ID you would like to update: "
    choice_id = gets.chomp
    puts "What would you like to update?\n\nFirst Name or Last Name: "
    user_choice = gets.chomp.downcase
    if user_choice == "first name"
      puts "Please enter the new first name of the student: "
      first_name = gets.chomp
      student = Student.read (student_id = choice_id)
      student.first_name = first_name
      student.update
    elsif user_choice == "last name"
      puts "Please enter the new last name of the student: "
      last_name = gets.chomp
      student = Student.read (student_id = choice_id)
      student.last_name = last_name
      student.update
    else
      puts "You did not choose a valid option. Please try again"
    end
  elsif menu_choice == "delete"
      puts "Please choose a Student ID you would like to delete"
      who_to_delete = gets.chomp
      puts "Are you sure you would like to delete? Yes or No?"
      yes_or_no = gets.chomp.downcase
        if yes_or_no == "yes"
          student = Student.delete (student_id = who_to_delete)
        elsif yes_or_no == "no"
          puts "You chose not to delete this student's records"
        else
          puts "You did not enter a valid option."
        end
  elsif menu_choice == "exit"
    puts "Thank you for using the Student Registration System. Goodbye!"
    not_exit = false
  else
    puts "You did not make a valid selection. Please try again."
  end
end
