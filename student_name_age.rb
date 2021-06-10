students = [
              {name: "Bob", age: 18},
              {name: "Alice", age: 20}
           ]

def find_by_name(students_collection, name)
  return nil unless name.is_a?(Hash)
    students_collection.select do |student|
      if :name
        student[:name] == name.values[0]
      end
  end
end


p find_by_name(students, {:name => "Bob"})
p find_by_name(students, {:name => "Carol"})
