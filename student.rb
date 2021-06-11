require 'csv'

class Student
  attr_accessor :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name  = last_name
    @age        = age
  end

  def save
    File.open('students.csv', 'a') do |student|
      student.write(self.to_csv)
    end
    puts "The record was written to the student file."
  end

  def to_csv
    CSV.generate do |csv|
      csv << [first_name, last_name, age]
    end
  end
end

puts "Please enter your First Name: "
first_name = gets.chomp
puts "Please enter your Last Name: "
last_name = gets.chomp
puts "Please enter your age: "
age = gets.chomp
student = Student.new(first_name, last_name, age)
p student.save
