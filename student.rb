class Student
  attr_accessor :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def first_name
    @first_name
  end

  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name
    @last_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def age
    @age
  end

  def age=(age)
    @age = age
  end

  def full_name
    puts "The student name is #{@first_name} #{@last_name} and they are #{@age} years old."
  end
end

student = Student.new("Nick", "Eglin", 24)

student.full_name
